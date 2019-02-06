SELECT `track`.`TrackId`,
    `track`.`Name`,
    `track`.`AlbumId`,
    `track`.`MediaTypeId`,
    `track`.`GenreId`,
    `track`.`Composer`,
    `track`.`Milliseconds`,
    `track`.`Bytes`,
    `track`.`UnitPrice`
FROM `chinook`.`track`
left join album on track.TrackId=album.AlbumId
left join artist on album.AlbumId=artist.ArtistId
left join mediatype on track.MediaTypeId=mediatype.MediaTypeId
left join genre on track.TrackId=genre.GenreId;
;