IF EXISTS (Select name from sys.tables where name = 'RegimenMap421')
DROP TABLE RegimenMap421
GO

CREATE TABLE RegimenMap421
(Regimen VARCHAR(1000) NULL
, RegimenCode VARCHAR(1000) NULL
, Age VARCHAR(1000) NULL
, RegimenLine INT NULL)
GO


WITH FirstLine AS 
 (SELECT 
'AZT/3TC/NVP' Regimen, 'AF1A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'AZT/NVP/3TC' Regimen, 'AF1A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/AZT/NVP' Regimen, 'AF1A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/NVP/AZT' Regimen, 'AF1A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'NVP/AZT/3TC' Regimen, 'AF1A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'NVP/3TC/AZT' Regimen, 'AF1A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'AZT/3TC/EFV' Regimen, 'AF1B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'AZT/EFV/3TC' Regimen, 'AF1B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/AZT/EFV' Regimen, 'AF1B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/EFV/AZT' Regimen, 'AF1B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'EFV/AZT/3TC' Regimen, 'AF1B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'EFV/3TC/AZT' Regimen, 'AF1B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'AZT/3TC/DTG' Regimen, 'AF1D' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'AZT/DTG/3TC' Regimen, 'AF1D' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/AZT/DTG' Regimen, 'AF1D' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/DTG/AZT' Regimen, 'AF1D' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'DTG/AZT/3TC' Regimen, 'AF1D' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'DTG/3TC/AZT' Regimen, 'AF1D' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'TDF/3TC/NVP' Regimen, 'AF2A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'TDF/NVP/3TC' Regimen, 'AF2A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/TDF/NVP' Regimen, 'AF2A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/NVP/TDF' Regimen, 'AF2A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'NVP/TDF/3TC' Regimen, 'AF2A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'NVP/3TC/TDF' Regimen, 'AF2A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'TDF/3TC/EFV' Regimen, 'AF2B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'TDF/EFV/3TC' Regimen, 'AF2B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/TDF/EFV' Regimen, 'AF2B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/EFV/TDF' Regimen, 'AF2B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'EFV/3TC/TDF' Regimen, 'AF2B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'EFV/TDF/3TC' Regimen, 'AF2B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'TDF/3TC/ATV/r' Regimen, 'AF2D' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'TDF/ATV/r/3TC' Regimen, 'AF2D' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/TDF/ATV/r' Regimen, 'AF2D' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/ATV/r/TDF' Regimen, 'AF2D' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'ATV/r/TDF/3TC' Regimen, 'AF2D' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'ATV/r/3TC/TDF' Regimen, 'AF2D' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'TDF/3TC/DTG' Regimen, 'AF2E' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'TDF/DTG/3TC' Regimen, 'AF2E' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/TDF/DTG' Regimen, 'AF2E' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/DTG/TDF' Regimen, 'AF2E' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'DTG/TDF/3TC' Regimen, 'AF2E' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'DTG/3TC/TDF' Regimen, 'AF2E' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT

/*'TDF/3TC/LPV/r' Regimen, 'AF2F' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'TDF/LPV/r/3TC' Regimen, 'AF2F' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/TDF/LPV/r' Regimen, 'AF2F' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/LPV/r/TDF' Regimen, 'AF2F' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'LPV/r/TDF/3TC' Regimen, 'AF2F' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'LPV/r/3TC/TDF' Regimen, 'AF2F' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'TDF/3TC/RAL' Regimen, 'AF2G' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'TDF/RAL/3TC' Regimen, 'AF2G' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/TDF/RAL' Regimen, 'AF2G' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/RAL/TDF' Regimen, 'AF2G' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'RAL/3TC/TDF' Regimen, 'AF2G' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'RAL/TDF/3TC' Regimen, 'AF2G' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'TDF/FTC/ATV/r' Regimen, 'AF2H' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'TDF/ATV/r/FTC' Regimen, 'AF2H' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'FTC/TDF/ATV/r' Regimen, 'AF2H' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'FTC/ATV/r/TDF' Regimen, 'AF2H' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'ATV/r/TDF/FTC' Regimen, 'AF2H' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'ATV/r/FTC/TDF' Regimen, 'AF2H' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
*/

'D4T/3TC/NVP' Regimen, 'AF3A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'D4T/NVP/3TC' Regimen, 'AF3A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/D4T/NVP' Regimen, 'AF3A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/NVP/D4T' Regimen, 'AF3A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'NVP/D4T/3TC' Regimen, 'AF3A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'NVP/3TC/D4T' Regimen, 'AF3A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT

'D4T/3TC/EFV' Regimen, 'AF3B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'D4T/EFV/3TC' Regimen, 'AF3B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/D4T/EFV' Regimen, 'AF3B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/EFV/D4T' Regimen, 'AF3B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'EFV/D4T/3TC' Regimen, 'AF3B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'EFV/3TC/D4T' Regimen, 'AF3B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT


'ABC/3TC/NVP' Regimen, 'AF4A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'ABC/NVP/3TC' Regimen, 'AF4A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/ABC/NVP' Regimen, 'AF4A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/NVP/ABC' Regimen, 'AF4A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'NVP/ABC/3TC' Regimen, 'AF4A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'NVP/3TC/ABC' Regimen, 'AF4A' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'ABC/3TC/EFV' Regimen, 'AF4B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'ABC/EFV/3TC' Regimen, 'AF4B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/ABC/EFV' Regimen, 'AF4B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/EFV/ABC' Regimen, 'AF4B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'EFV/ABC/3TC' Regimen, 'AF4B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'EFV/3TC/ABC' Regimen, 'AF4B' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'ABC/3TC/DTG' Regimen, 'AF4C' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'ABC/DTG/3TC' Regimen, 'AF4C' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/ABC/DTG' Regimen, 'AF4C' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'3TC/DTG/ABC' Regimen, 'AF4C' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'DTG/ABC/3TC' Regimen, 'AF4C' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT
'DTG/3TC/ABC' Regimen, 'AF4C' RegimenCode, 'ADULT' Age, 1 RegimenLine UNION ALL SELECT

'AZT/3TC/NVP' Regimen, 'CF1A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'AZT/NVP/3TC' Regimen, 'CF1A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/AZT/NVP' Regimen, 'CF1A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/NVP/AZT' Regimen, 'CF1A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'NVP/AZT/3TC' Regimen, 'CF1A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'NVP/3TC/AZT' Regimen, 'CF1A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'AZT/3TC/EFV' Regimen, 'CF1B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'AZT/EFV/3TC' Regimen, 'CF1B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/AZT/EFV' Regimen, 'CF1B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/EFV/AZT' Regimen, 'CF1B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'EFV/AZT/3TC' Regimen, 'CF1B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'EFV/3TC/AZT' Regimen, 'CF1B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'AZT/3TC/LPV/r' Regimen, 'CF1C' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'AZT/LPV/r/3TC' Regimen, 'CF1C' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/AZT/LPV/r' Regimen, 'CF1C' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/LPV/r/AZT' Regimen, 'CF1C' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'LPV/r/AZT/3TC' Regimen, 'CF1C' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'LPV/r/3TC/AZT' Regimen, 'CF1C' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'AZT/3TC/ATV/r' Regimen, 'CF1D' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'AZT/ATV/r/3TC' Regimen, 'CF1D' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/AZT/ATV/r' Regimen, 'CF1D' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/ATV/r/AZT' Regimen, 'CF1D' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'ATV/r/AZT/3TC' Regimen, 'CF1D' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'ATV/r/3TC/AZT' Regimen, 'CF1D' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'AZT/3TC/RAL' Regimen, 'CF1E' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'AZT/RAL/3TC' Regimen, 'CF1E' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/AZT/RAL' Regimen, 'CF1E' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/RAL/AZT' Regimen, 'CF1E' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'RAL/AZT/3TC' Regimen, 'CF1E' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'RAL/3TC/AZT' Regimen, 'CF1E' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'ABC/3TC/NVP' Regimen, 'CF2A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'ABC/NVP/3TC' Regimen, 'CF2A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/ABC/NVP' Regimen, 'CF2A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/NVP/ABC' Regimen, 'CF2A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'NVP/ABC/3TC' Regimen, 'CF2A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'NVP/3TC/ABC' Regimen, 'CF2A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'ABC/3TC/EFV' Regimen, 'CF2B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'ABC/EFV/3TC' Regimen, 'CF2B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/ABC/EFV' Regimen, 'CF2B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/EFV/ABC' Regimen, 'CF2B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'EFV/ABC/3TC' Regimen, 'CF2B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'EFV/3TC/ABC' Regimen, 'CF2B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'ABC/3TC/LPV/r' Regimen, 'CF2D' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'ABC/LPV/r/3TC' Regimen, 'CF2D' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/ABC/LPV/r' Regimen, 'CF2D' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/LPV/r/ABC' Regimen, 'CF2D' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'LPV/r/ABC/3TC' Regimen, 'CF2D' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'LPV/r/3TC/ABC' Regimen, 'CF2D' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'ABC/3TC/ATV/r' Regimen, 'CF2E' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'ABC/ATV/r/3TC' Regimen, 'CF2E' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/ABC/ATV/r' Regimen, 'CF2E' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/ATV/r/ABC' Regimen, 'CF2E' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'ATV/r/ABC/3TC' Regimen, 'CF2E' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'ATV/r/3TC/ABC' Regimen, 'CF2E' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'ABC/3TC/RAL' Regimen, 'CF2F' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'ABC/RAL/3TC' Regimen, 'CF2F' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/ABC/RAL' Regimen, 'CF2F' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/RAL/ABC' Regimen, 'CF2F' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'RAL/ABC/3TC' Regimen, 'CF2F' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'RAL/3TC/ABC' Regimen, 'CF2F' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT

'D4T/3TC/NVP' Regimen, 'CF3A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'D4T/NVP/3TC' Regimen, 'CF3A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/D4T/NVP' Regimen, 'CF3A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/NVP/D4T' Regimen, 'CF3A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'NVP/D4T/3TC' Regimen, 'CF3A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'NVP/3TC/D4T' Regimen, 'CF3A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT

'D4T/3TC/EFV' Regimen, 'CF3B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'D4T/EFV/3TC' Regimen, 'CF3B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/D4T/EFV' Regimen, 'CF3B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/EFV/D4T' Regimen, 'CF3B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'EFV/D4T/3TC' Regimen, 'CF3B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'EFV/3TC/D4T' Regimen, 'CF3B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT


'TDF/3TC/NVP' Regimen, 'CF4A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'TDF/NVP/3TC' Regimen, 'CF4A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/TDF/NVP' Regimen, 'CF4A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/NVP/TDF' Regimen, 'CF4A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'NVP/TDF/3TC' Regimen, 'CF4A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'NVP/3TC/TDF' Regimen, 'CF4A' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'TDF/3TC/EFV' Regimen, 'CF4B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'TDF/EFV/3TC' Regimen, 'CF4B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/TDF/EFV' Regimen, 'CF4B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/EFV/TDF' Regimen, 'CF4B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'EFV/TDF/3TC' Regimen, 'CF4B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'EFV/3TC/TDF' Regimen, 'CF4B' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'TDF/3TC/LPV/r' Regimen, 'CF4C' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'TDF/LPV/r/3TC' Regimen, 'CF4C' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/TDF/LPV/r' Regimen, 'CF4C' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/LPV/r/TDF' Regimen, 'CF4C' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'LPV/r/TDF/3TC' Regimen, 'CF4C' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'LPV/r/3TC/TDF' Regimen, 'CF4C' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'TDF/3TC/ATV/r' Regimen, 'CF4D' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'TDF/ATV/r/3TC' Regimen, 'CF4D' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/TDF/ATV/r' Regimen, 'CF4D' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'3TC/ATV/r/TDF' Regimen, 'CF4D' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'ATV/r/TDF/3TC' Regimen, 'CF4D' RegimenCode, 'CHILD' Age, 1 RegimenLine UNION ALL SELECT
'ATV/r/3TC/TDF' Regimen, 'CF4D' RegimenCode, 'CHILD' Age, 1 RegimenLine)


, SecondLine AS (SELECT 'AZT/3TC/LPV/r' Regimen, 'AS1A' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'AZT/LPV/r/3TC' Regimen, 'AS1A' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT '3TC/AZT/LPV/r' Regimen, 'AS1A' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT '3TC/LPV/r/AZT' Regimen, 'AS1A' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'LPV/r/AZT/3TC' Regimen, 'AS1A' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'LPV/r/3TC/AZT' Regimen, 'AS1A' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'AZT/3TC/ATV/r' Regimen, 'AS1B' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'AZT/ATV/r/3TC' Regimen, 'AS1B' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT '3TC/AZT/ATV/r' Regimen, 'AS1B' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT '3TC/ATV/r/AZT' Regimen, 'AS1B' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'ATV/r/AZT/3TC' Regimen, 'AS1B' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'ATV/r/3TC/AZT' Regimen, 'AS1B' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'TDF/3TC/LPV/r' Regimen, 'AS2A' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'TDF/LPV/r/3TC' Regimen, 'AS2A' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT '3TC/TDF/LPV/r' Regimen, 'AS2A' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT '3TC/LPV/r/TDF' Regimen, 'AS2A' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'LPV/r/TDF/3TC' Regimen, 'AS2A' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'LPV/r/3TC/TDF' Regimen, 'AS2A' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'TDF/3TC/ATV/r' Regimen, 'AS2C' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'TDF/ATV/r/3TC' Regimen, 'AS2C' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT '3TC/TDF/ATV/r' Regimen, 'AS2C' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT '3TC/ATV/r/TDF' Regimen, 'AS2C' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'ATV/r/TDF/3TC' Regimen, 'AS2C' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'ATV/r/3TC/TDF' Regimen, 'AS2C' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'ABC/3TC/LPV/r' Regimen, 'AS5A' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'ABC/LPV/r/3TC' Regimen, 'AS5A' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT '3TC/ABC/LPV/r' Regimen, 'AS5A' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT '3TC/LPV/r/ABC' Regimen, 'AS5A' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'LPV/r/ABC/3TC' Regimen, 'AS5A' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'LPV/r/3TC/ABC' Regimen, 'AS5A' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'ABC/3TC/ATV/r' Regimen, 'AS5B' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'ABC/ATV/r/3TC' Regimen, 'AS5B' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT '3TC/ABC/ATV/r' Regimen, 'AS5B' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT '3TC/ATV/r/ABC' Regimen, 'AS5B' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'ATV/r/ABC/3TC' Regimen, 'AS5B' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'ATV/r/3TC/ABC' Regimen, 'AS5B' RegimenCode, 'ADULT' Age, 2 RegimenLine UNION
SELECT 'AZT/3TC/LPV/r' Regimen, 'CS1A' RegimenCode, 'CHILD' Age, 2 RegimenLine UNION
SELECT 'AZT/LPV/r/3TC' Regimen, 'CS1A' RegimenCode, 'CHILD' Age, 2 RegimenLine UNION
SELECT '3TC/AZT/LPV/r' Regimen, 'CS1A' RegimenCode, 'CHILD' Age, 2 RegimenLine UNION
SELECT '3TC/LPV/r/AZT' Regimen, 'CS1A' RegimenCode, 'CHILD' Age, 2 RegimenLine UNION
SELECT 'LPV/r/AZT/3TC' Regimen, 'CS1A' RegimenCode, 'CHILD' Age, 2 RegimenLine UNION
SELECT 'LPV/r/3TC/AZT' Regimen, 'CS1A' RegimenCode, 'CHILD' Age, 2 RegimenLine UNION

SELECT 'AZT/3TC/ATV/r' Regimen, 'CS1B' RegimenCode, 'CHILD' Age, 2 RegimenLine UNION
SELECT 'AZT/ATV/r/3TC' Regimen, 'CS1B' RegimenCode, 'CHILD' Age, 2 RegimenLine UNION
SELECT '3TC/AZT/ATV/r' Regimen, 'CS1B' RegimenCode, 'CHILD' Age, 2 RegimenLine UNION
SELECT '3TC/ATV/r/AZT' Regimen, 'CS1B' RegimenCode, 'CHILD' Age, 2 RegimenLine UNION
SELECT 'ATV/r/AZT/3TC' Regimen, 'CS1B' RegimenCode, 'CHILD' Age, 2 RegimenLine UNION
SELECT 'ATV/r/3TC/AZT' Regimen, 'CS1B' RegimenCode, 'CHILD' Age, 2 RegimenLine


)

, AllRegimens AS
(Select * FROM FirstLine
UNION
Select * FROM SecondLine)

INSERT INTO RegimenMap421
SELECT * FROM AllRegimens
GO
