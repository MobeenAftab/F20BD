-- This script will join all the tables relating to a track into one
SELECT `track`.`TrackId`, `track`.`Name`,
`track`.`AlbumId`, `track`.`MediaTypeId`, 
`track`.`GenreId`, `track`.`Composer`,
`track`.`Milliseconds`, `track`.`Bytes`,
`track`.`UnitPrice`,
`album`.`AlbumId`, `album`.`Title`, `album`.`ArtistId`,
`artist`.`ArtistId`, `artist`.`Name`,
`mediatype`.`MediaTypeId`, `mediatype`.`Name`,
`genre`.`GenreId`, `genre`.`Name`,
`playlisttrack`.`PlaylistId`, `playlisttrack`.`TrackId`,
`playlist`.`PlaylistId`, `playlist`.`Name`
FROM `chinook`.`track`
join album on track.TrackId=album.AlbumId
join artist on artist.ArtistId=album.AlbumId
join mediatype on track.MediaTypeId=mediatype.MediaTypeId
join genre on track.TrackId=genre.GenreId
join playlisttrack on playlisttrack.PlaylistId=track.TrackId
join playlist on playlist.PlaylistId=playlisttrack.PlaylistId
group by track.TrackId;
