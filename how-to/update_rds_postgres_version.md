## How to update a postgres version in RDS

#### Relevant documentation:
  - [AWS Guide](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.PostgreSQL.MajorVersion.Process.html)
  - [Version upgrade path matrix](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.PostgreSQL.MajorVersion.html)

#### Before you upgrade:
  - Verify the version you want to upgrade to is in the matrix above. You might need to do multiple upgrades, one at a time, to get to the intended version from the current version.
  - From a SQL prompt (psql) connected to the relevant database, perform the read queries in the AWS guide above to check for version incompatabilties. Resolve as necessary before proceeding.
  - Pause/Stop any tasks or outside services that would need the DB during the downtime where possible.

#### Upgrading:
  - Follow the steps in the AWS console laid out here: [Manually upgrading the engine version](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.Upgrading.html#USER_UpgradeDBInstance.Upgrading.Manual)
  - Should the upgrade fail, the RDS instance will provide a log ```pg_upgrade_precheck.log``` detailing why the upgrade would fail. Resolving those issues is out of the scope for this how-to but is likely covered in the steps above in "Before you upgrade"
  - Once successful, from a SQL prompt, make sure and run the following command on the DB that was upgraded if it was a major version upgrade ```ANALYZE VERBOSE;```. "Optimizer statistics aren't transferred during a major version upgrade, so you need to regenerate all statistics to avoid performance issues."
  - Its worth noting, even thought we aren't currently using it, RDS instances with Multi-AZ enabled will need to have the read replicas recreated based on the upgraded primary DB. This will need to be done manually.
