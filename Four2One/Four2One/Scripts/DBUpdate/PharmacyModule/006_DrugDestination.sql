IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'DrugDestination')
BEGIN

CREATE TABLE dbo.DrugDestination(
	Id int IDENTITY(1,1) NOT NULL,
	DrugDestinationCode nvarchar(100) NOT NULL,
	DrugDestinationName nvarchar(100) not null,
	IsBorrowed INT NOT NULL,
	IsSatelliteFacility INT NOT NULL,
	IsDispensingStore INT NOT NULL
	CONSTRAINT [PK_DrugDestination] PRIMARY KEY CLUSTERED
	(Id ASC ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END


IF NOT EXISTS(SELECT * FROM DrugDestination WHERE DrugDestinationName = 'MY DISPENSING STORE')
INSERT INTO DrugDestination(DrugDestinationCode, DrugDestinationName, IsBorrowed, IsSatelliteFacility, IsDispensingStore)
VALUES
('MY DISPENSING STORE','MY DISPENSING STORE', 0, 0, 1);

IF NOT EXISTS(SELECT * FROM DrugDestination WHERE DrugDestinationName = 'SATELLITE FACILITY')
INSERT INTO DrugDestination(DrugDestinationCode, DrugDestinationName, IsBorrowed, IsSatelliteFacility, IsDispensingStore)
VALUES
('SATELLITE FACILITY','SATELLITE FACILITY', 0, 1, 0);

IF NOT EXISTS(SELECT * FROM DrugDestination WHERE DrugDestinationName = 'BORROW OUT TO OTHER FACILITY')
INSERT INTO DrugDestination(DrugDestinationCode, DrugDestinationName, IsBorrowed, IsSatelliteFacility, IsDispensingStore)
VALUES
('BORROW OUT TO OTHER FACILITY','BORROW OUT TO OTHER FACILITY', 1, 0, 0);
