-- Desvincular claves foráneas antes de eliminar las tablas
SET FOREIGN_KEY_CHECKS = 0;

-- Eliminar tablas
DROP TABLE IF EXISTS CompanyModuleAssignments;
DROP TABLE IF EXISTS ModuleAssignments;
DROP TABLE IF EXISTS OrganizationHierarchy;
DROP TABLE IF EXISTS UserActivities;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS Roles;

-- Restaurar verificación de claves foráneas
SET FOREIGN_KEY_CHECKS = 1;

-- Eliminar la base de datos
DROP DATABASE IF EXISTS Tm;
