RAUC hawkBit Update
===================

This chapter gives an overview about updating the system via *RAUC* and
*hawkBit*.

The following components are involved:

  - `hawkBit <https://www.eclipse.org/hawkbit/>`_
  - `rauc-hawkbit-updater <https://github.com/rauc/rauc-hawkbit-updater>`_
    (``rauc-hawkbit-updater`` package in BSP)
  - `RAUC <https://www.rauc.io/>`_ (``host-rauc`` and ``rauc`` packages in BSP)

hawkBit is a "back-end framework for rolling out software updates" [#f1]_.
rauc-hawkbit-updater "runs on [the] target and operates as an interface between
the
`RAUC D-Bus API <https://rauc.readthedocs.io/en/latest/reference.html#d-bus-api>`_
and the
`hawkBit DDI API <https://www.eclipse.org/hawkbit/apis/ddi_api/>`_." [#f2]_.
Finally, "RAUC controls the update process [...]. It is both a target
application that runs as an update client and a host/target tool that allows
[...] to create, inspect and modify installation artifacts" [#f3]_.

rauc-hawkbit-updater starts automatically on boot and authenticates itself
against the hawkBit server via its configured *security token* (also referred
to as ``auth_token``).
Once it is authenticated, it will upload additional device information data
to hawkBit.
Then rauc-hawkbit-updater polls hawkBit regularly for updates.

Prerequisites for the update workflow and the update workflow itself are
described in the following sections of this chapter.

.. important:: Note that rauc-hawkbit-updater is still under development.
  Some aspects of hawkBit's DDI API are currently not implemented.
  Functionality not described in this chapter might not work at all or might
  even lead to unexpected results!

.. [#f1] https://www.eclipse.org/hawkbit/whatishawkbit/
.. [#f2] https://github.com/rauc/rauc-hawkbit-updater/blob/master/README.md
.. [#f3] https://github.com/rauc/rauc/blob/master/README.rst

Prerequisites
-------------

Setting Up hawkBit
^^^^^^^^^^^^^^^^^^

For testing purposes, a hawkBit instance can be started via a docker container
[#f4]_.
Assuming docker is installed on the host, the container can be started via::

  $ docker run -p 8080:8080 hawkbit/hawkbit-update-server

If everything worked as expected, hawkBit's web UI is available at::

  http://localhost:8080

Now log in with user name ``admin`` and password ``admin``.

The polling interval is configurable via **System Config** -> **Polling
Configuration** -> **Polling Time**).

.. [#f4] https://www.eclipse.org/hawkbit/gettingstarted/

hawkBit Target Creation
^^^^^^^^^^^^^^^^^^^^^^^

In order to allow the target to authenticate itself against hawkBit, a new
target must be created in hawkBit and its authentication must be set in
rauc-hawkbit-updater's configuration.
If multiple targets should receive updates, this step must be performed for
each target.

In hawkBit's web UI navigate to **Deployment** (sidebar) -> **Targets** ->
**+** ("Create new target"):

  - choose *Controller ID* freely
  - save

Now navigate to **Deployment** (sidebar) -> **Targets**:

  - select created target
  - copy *Security token* from the "Details" box below

The board that should receive updates must know about the hawkBit instance as
well as the security token:

Log in on the board and edit ``/config/rauc-hawkbit-updater/config.conf``:

  - hawkbit_server: ``<docker-host-ip>:8080``
  - target_name: set the value chosen for *Controller ID* above
  - auth_token: paste the *Security token* which was copied above

The data to be pusehd to hawkBit can be configured in the ``[device]`` section.
These information can be the mac, a serial numer, revision or any other
information useful for identifying or filtering targets in hawkBit.

On the target, restart the rauc-hawkbit-updater service::

  $ systemctl restart rauc-hawkbit-updater

.. note:: hawkBit/rauc-hawkbit-updater allow alternative authentication
  methods.
  This document describes authentication only via security token
  (``auth_token``) for the sake of simplicity.

.. note:: If this auth method is designated for production, ``target_name`` and
  ``auth_token`` (and information in ``[device]``) should be set by a
  provisioning script for each device individually.
  ``hawkbit_server`` could be set in the BSP in the initial config in
  ``projectroot/etc/rauc-hawkbit-updater/config.conf.initial``.
  hawkBit target registration is scriptable via its
  `Management API <https://www.eclipse.org/hawkbit/apis/management_api/>`_.

Creating RAUC Update Bundles
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

RAUC update bundles are created either while creating all images::

  $ ptxdist images -q -j

Or explicitly with::

  $ ptxdist image update.raucb -q -j

hawkBit Software Module and Distribution Creation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Only a subset of hawkBit's abstraction for creating deployable updates applies
to the RAUC use case.
Thus some steps described here may appear redundant.

hawkBit has the concept of a *Distribution*.
Distributions can be assigned to targets for deployment.
A distribution contains one or more *Software Modules*.
Each software module represents a set of uploadable artifacts.

For the RAUC bundle use case, a distribution contains exactly one software
module with exactly one artifact (the RAUC bundle).

Now create a hawkBit *Software Module* and a *Distribution*.

In hawkBit's web UI navigate to **Upload** (sidebar) -> **Software Module** ->
**+** ("Create new Software Module"):

  - *Type*: OS
  - *Name*: choose freely
  - *Version*: choose freely
  - *save*

Now navigate to **Upload** (sidebar) -> **Software Module**:

  - select created software module
  - on the right-hand side: **Upload File**:
    select ``platform-iotmaxx-gateway/images/update.raucb``
  - close the *Upload status* pop-up after the bundle has been successfully uploaded

Now navigate to **Distributions** (sidebar) -> **Distributions** -> **Create new Distribution**

  - *Select Type*: "OS only" or "OS with app(s)"
  - *Name*: choose freely
  - *Version*: choose freely
  - *save*

Now nagivate to **Distributions** (sidebar):

  - drag the created software module onto the designated distribution
  - *Confirm Assignment*: ok

Triggering Single Updates
^^^^^^^^^^^^^^^^^^^^^^^^^

Everything is prepared to trigger the roll-out of the created update on the
created target:

Navigate to **Deployment** (sidebar):

  - drag the distribution onto the designated target
  - *Confirm Assignment*, select *Forced* method, confirm with *OK*.

When rauc-hawkbit-updater polls hawkBit's DDI API the next time, it will
receive an update request.
The RAUC bundle will be downloaded and the RAUC service will be triggered via
D-BUS to install the bundle.
rauc-hawkbit-updater sends feedback about the update progress received from
the RAUC service.
The update progress is available in hawkbit's web UI at **Deployment** (sidebar) -> **Action history for <target>**

.. note:: For testing purposes, one might want to update a distribution on a
  target multiple times.
  If the update was installed successfully once, hawkBit will not trigger the
  update anymore.
  In order to achieve that, a second distribution with the same software module
  can be created.
  The distributions can now be dragged onto the designated target in
  alternating fashion.

Triggering Larger Rollouts
^^^^^^^^^^^^^^^^^^^^^^^^^^

hawkBit also supports triggering larger scheduled Rollouts which update the
devices in the field in different groups one after the other with checking if a
configured percentage succeed before continuing the rollout.

.. note:: This has not been tested yet.
