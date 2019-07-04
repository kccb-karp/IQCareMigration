IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'DrugSource')
BEGIN

CREATE TABLE dbo.DrugSource(
	Id int IDENTITY(1,1) NOT NULL,
	DrugSourceCode nvarchar(100) NOT NULL,
	DrugSourceName nvarchar(100) not null,
	IsBorrowed INT NOT NULL,
	IsParentFacility INT NOT NULL,
	IsSupplier INT NOT NULL,
	IsHealthFacility INT NOT NULL
	CONSTRAINT [PK_DrugSource] PRIMARY KEY CLUSTERED
	(Id ASC ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END


IF NOT EXISTS(SELECT * FROM DrugSource WHERE DrugSourceName = 'KEMSA')
INSERT INTO DrugSource(DrugSourceCode, DrugSourceName, IsBorrowed
, IsParentFacility, IsSupplier, IsHealthFacility)
VALUES
('KEMSA','KEMSA', 0, 0, 1, 0);

IF NOT EXISTS(SELECT * FROM DrugSource WHERE DrugSourceName = 'PARENT FACILITY')
INSERT INTO DrugSource(DrugSourceCode, DrugSourceName, IsBorrowed
, IsParentFacility, IsSupplier, IsHealthFacility)
VALUES
('PARENT FACILITY','PARENT FACILITY', 0, 1, 0, 1);

IF NOT EXISTS(SELECT * FROM DrugSource WHERE DrugSourceName = 'BORROW FROM OTHER FACILITY')
INSERT INTO DrugSource(DrugSourceCode, DrugSourceName, IsBorrowed
, IsParentFacility, IsSupplier, IsHealthFacility)
VALUES
('OTHER FACILITY','BORROW FROM OTHER FACILITY', 1, 0, 0, 1);

IF NOT EXISTS(SELECT * FROM DrugSource WHERE DrugSourceName = 'OTHER SUPPLIER')
INSERT INTO DrugSource(DrugSourceCode, DrugSourceName, IsBorrowed
, IsParentFacility, IsSupplier, IsHealthFacility)
VALUES
('OTHER SUPPLIER','OTHER SUPPLIER', 0, 0, 1, 0);
