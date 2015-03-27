/*DATAMIGRATION 33EA1F9E-1A89-4CF0-9AD3-A8E10BEF2D3C*/ -- Change the script's code only if the it needs to be executed again.

EXEC Rhetos.DataMigrationUse 'Common', 'Permission', 'ID', 'uniqueidentifier';
EXEC Rhetos.DataMigrationUse 'Common', 'Permission', 'RoleID', 'uniqueidentifier';
EXEC Rhetos.DataMigrationUse 'Common', 'Permission', 'PrincipalID', 'uniqueidentifier';
EXEC Rhetos.DataMigrationUse 'Common', 'Permission', 'ClaimID', 'uniqueidentifier';
EXEC Rhetos.DataMigrationUse 'Common', 'Permission', 'IsAuthorized', 'bit';
-- The following lines are generated by: EXEC Rhetos.HelpDataMigration 'Common', 'RolePermission';
EXEC Rhetos.DataMigrationUse 'Common', 'RolePermission', 'ID', 'uniqueidentifier';
EXEC Rhetos.DataMigrationUse 'Common', 'RolePermission', 'RoleID', 'uniqueidentifier';
EXEC Rhetos.DataMigrationUse 'Common', 'RolePermission', 'ClaimID', 'uniqueidentifier';
EXEC Rhetos.DataMigrationUse 'Common', 'RolePermission', 'IsAuthorized', 'bit';
-- The following lines are generated by: EXEC Rhetos.HelpDataMigration 'Common', 'PrincipalPermission';
EXEC Rhetos.DataMigrationUse 'Common', 'PrincipalPermission', 'ID', 'uniqueidentifier';
EXEC Rhetos.DataMigrationUse 'Common', 'PrincipalPermission', 'PrincipalID', 'uniqueidentifier';
EXEC Rhetos.DataMigrationUse 'Common', 'PrincipalPermission', 'ClaimID', 'uniqueidentifier';
EXEC Rhetos.DataMigrationUse 'Common', 'PrincipalPermission', 'IsAuthorized', 'bit';
GO

IF NOT EXISTS (SELECT * FROM _Common.RolePermission) AND NOT EXISTS (SELECT * FROM _Common.PrincipalPermission)
BEGIN
	INSERT INTO
		_Common.RolePermission (ID, RoleID, ClaimID, IsAuthorized)
	SELECT
		ID, RoleID, ClaimID, IsAuthorized
	FROM
		_Common.Permission p
	WHERE
		p.RoleID IS NOT NULL
	
	INSERT INTO
		_Common.PrincipalPermission (ID, PrincipalID, ClaimID, IsAuthorized)
	SELECT
		ID, PrincipalID, ClaimID, IsAuthorized
	FROM
		_Common.Permission p
	WHERE
		p.PrincipalID IS NOT NULL
END;

EXEC Rhetos.DataMigrationApplyMultiple 'Common', 'RolePermission', 'ID, RoleID, ClaimID, IsAuthorized';
EXEC Rhetos.DataMigrationApplyMultiple 'Common', 'PrincipalPermission', 'ID, PrincipalID, ClaimID, IsAuthorized';