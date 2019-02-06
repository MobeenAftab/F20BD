SELECT `track`.`TrackId`, `track`.`Name`, `track`.`AlbumId`, `track`.`MediaTypeId`, `track`.`GenreId`, `track`.`Composer`, `track`.`Milliseconds`, `track`.`Bytes`, `track`.`UnitPrice`,
`album`.`AlbumId`, `album`.`Title`, `album`.`ArtistId`,
`artist`.`ArtistId`, `artist`.`Name`,
`mediatype`.`MediaTypeId`, `mediatype`.`Name`,
`genre`.`GenreId`, `genre`.`Name`
#`playlisttrack`.`PlaylistId`, `playlisttrack`.`TrackId`,
#`playlist`.`PlaylistId`, `playlist`.`Name`
FROM `chinook`.`track`
left join album on track.TrackId=album.AlbumId
left join artist on artist.ArtistId=album.AlbumId
left join mediatype on track.MediaTypeId=mediatype.MediaTypeId
left join genre on track.TrackId=genre.GenreId
#left join playlisttrack on playlisttrack.PlaylistId=playlist.PlaylistId;
;
# Can remove duplicating ID's or FK ID's and keep value
# Join the playlist tracks togather