--Progresql
SELECT COUNT(uid) FROM
(
    SELECT DISTINCT uid FROM piwik_track 
    WHERE event_name = 'FIRST_INSTALL'
    AND DATE(time) = '2017-04-01'
) AS installs
INNER JOIN 
(
    SELECT uid
    FROM piwik_track
    WHERE event_name != 'FIRST_INSTALL'
    AND DATE(time) BETWEEN '2017-04-02' AND '2017-04-08'
    GROUP BY uid
    HAVING COUNT(*) > 1
) AS usages
USING (uid);