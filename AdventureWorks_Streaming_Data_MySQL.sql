USE adventureworks;

# 1181 rows divided by 3 is 393 + 394 + 394
SELECT COUNT(*) AS RowCount
FROM adventureworks.productinventory AS pi
LEFT OUTER JOIN adventureworks.product AS p
    ON pi.productID = p.ProductID
LEFT OUTER JOIN adventureworks.location AS loc
    ON pi.LocationID = loc.LocationID
LEFT OUTER JOIN adventureworks.productvendor AS pv
    ON pv.ProductID = pi.ProductID
INNER JOIN adventureworks.vendor AS v
    ON v.VendorID = pv.VendorID;


# SELECT EVERYTHING that should end up in the "Silver" Table
SELECT pi.productID,
	pi.locationID,
    v.VendorID,
    pi.ModifiedDate,
    pv.LastReceiptDate,
    pi.Shelf,
    pi.Bin,
    pi.Quantity,
    p.Size,
    p.Weight,
    loc.CostRate,
    loc.Availability,
    pv.AverageLeadTime,
    v.PreferredVendorStatus,
    pv.MinOrderQty,
    pv.MaxOrderQty,
    pv.OnOrderQty
FROM adventureworks.productinventory AS pi
LEFT OUTER JOIN adventureworks.product AS p
ON pi.productID = p.ProductID
LEFT OUTER JOIN adventureworks.location as loc
ON pi.LocationID = loc.LocationID
LEFT OUTER JOIN adventureworks.productvendor as pv
ON pv.ProductID = pi.ProductID
INNER JOIN adventureworks.vendor as v
ON v.VendorID = pv.VendorID;


WITH RowNumbers AS (
    SELECT 
        pi.productID,
        pi.locationID,
        v.VendorID,
        pi.ModifiedDate,
        pv.LastReceiptDate,
        pi.Shelf,
        pi.Bin,
        pi.Quantity,
        p.Size,
        p.Weight,
        loc.CostRate,
        loc.Availability,
        pv.AverageLeadTime,
        v.PreferredVendorStatus,
        pv.MinOrderQty,
        pv.MaxOrderQty,
        pv.OnOrderQty,
        ROW_NUMBER() OVER (ORDER BY pi.productID) AS RowNum
    FROM adventureworks.productinventory AS pi
    LEFT OUTER JOIN adventureworks.product AS p
        ON pi.productID = p.ProductID
    LEFT OUTER JOIN adventureworks.location AS loc
        ON pi.LocationID = loc.LocationID
    LEFT OUTER JOIN adventureworks.productvendor AS pv
        ON pv.ProductID = pi.ProductID
    INNER JOIN adventureworks.vendor AS v
        ON v.VendorID = pv.VendorID
)
SELECT *
FROM RowNumbers
WHERE RowNum BETWEEN 1 AND 393; 

WITH RowNumbers AS (
    SELECT 
        pi.productID,
        pi.locationID,
        v.VendorID,
        pi.ModifiedDate,
        pv.LastReceiptDate,
        pi.Shelf,
        pi.Bin,
        pi.Quantity,
        p.Size,
        p.Weight,
        loc.CostRate,
        loc.Availability,
        pv.AverageLeadTime,
        v.PreferredVendorStatus,
        pv.MinOrderQty,
        pv.MaxOrderQty,
        pv.OnOrderQty,
        ROW_NUMBER() OVER (ORDER BY pi.productID) AS RowNum
    FROM adventureworks.productinventory AS pi
    LEFT OUTER JOIN adventureworks.product AS p
        ON pi.productID = p.ProductID
    LEFT OUTER JOIN adventureworks.location AS loc
        ON pi.LocationID = loc.LocationID
    LEFT OUTER JOIN adventureworks.productvendor AS pv
        ON pv.ProductID = pi.ProductID
    INNER JOIN adventureworks.vendor AS v
        ON v.VendorID = pv.VendorID
)
SELECT *
FROM RowNumbers
WHERE RowNum BETWEEN 394 AND 787;  -- Second 1/3 of rows

WITH RowNumbers AS (
    SELECT 
        pi.productID,
        pi.locationID,
        v.VendorID,
        pi.ModifiedDate,
        pv.LastReceiptDate,
        pi.Shelf,
        pi.Bin,
        pi.Quantity,
        p.Size,
        p.Weight,
        loc.CostRate,
        loc.Availability,
        pv.AverageLeadTime,
        v.PreferredVendorStatus,
        pv.MinOrderQty,
        pv.MaxOrderQty,
        pv.OnOrderQty,
        ROW_NUMBER() OVER (ORDER BY pi.productID) AS RowNum
    FROM adventureworks.productinventory AS pi
    LEFT OUTER JOIN adventureworks.product AS p
        ON pi.productID = p.ProductID
    LEFT OUTER JOIN adventureworks.location AS loc
        ON pi.LocationID = loc.LocationID
    LEFT OUTER JOIN adventureworks.productvendor AS pv
        ON pv.ProductID = pi.ProductID
    INNER JOIN adventureworks.vendor AS v
        ON v.VendorID = pv.VendorID
)
SELECT *
FROM RowNumbers
WHERE RowNum BETWEEN 788 AND 1181;  -- Last 1/3 of rows