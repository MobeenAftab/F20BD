-- Generate a csv file combining all tables relating to a track,
-- this will result in a document with duplicate TrackId to capture all Denormalized instances.
SELECT 
`track`.`TrackId`, 
`track`.`Name`, 
`track`.`Composer`, 
`track`.`Milliseconds`, 
`track`.`Bytes`, 
`track`.`UnitPrice`,
`album`.`Title`,
`artist`.`Name` as ArtistName,
`mediatype`.`Name` as MediaType,
`genre`.`Name` as Genre,
`playlist`.`Name` as PlaylistName
FROM `chinook`.`track`
left join album on album.AlbumId=track.TrackId
left join artist on artist.ArtistId=album.AlbumId
left join mediatype on mediatype.MediaTypeId=track.MediaTypeId
left join genre on genre.GenreId=track.GenreId
left join playlisttrack on playlisttrack.TrackId=track.TrackId
left join playlist on playlist.PlaylistId=playlisttrack.PlaylistId
;
