SELECT 
    ip,
    COUNT(*) AS invalid_count
FROM logs
WHERE 
    -- 1. Kiểm tra giá trị > 255 ở bất kỳ octet nào
    CAST(SUBSTRING_INDEX(ip, '.', 1) AS UNSIGNED) > 255
    OR CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 2), '.', -1) AS UNSIGNED) > 255
    OR CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 3), '.', -1) AS UNSIGNED) > 255
    OR CAST(SUBSTRING_INDEX(ip, '.', -1) AS UNSIGNED) > 255
    
    -- 2. Kiểm tra lỗi số 0 đứng đầu (ví dụ: 01, 00, 05...)
    OR ip REGEXP '(^|\\.)0[0-9]'
    
    -- 3. Kiểm tra số lượng octet (phải có đúng 3 dấu chấm, nghĩa là đủ 4 phần)
    OR (LENGTH(ip) - LENGTH(REPLACE(ip, '.', ''))) <> 3
GROUP BY ip
ORDER BY invalid_count DESC, ip DESC;