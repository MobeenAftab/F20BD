SELECT
`playlisttrack`.`PlaylistId`,
`playlisttrack`.`TrackId`,
`playlist`.`PlaylistId`,
`playlist`.`Name`
FROM `chinook`.`playlist`
left join playlisttrack on playlisttrack.PlaylistId=playlist.PlaylistId
#group by playlist.Name;

;