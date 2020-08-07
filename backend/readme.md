Back on C# (.NET Core) 

# Апи прослушанной музыки:

Создание записи:

```
Post  /api/ListenedMusics
{
"MusicName": {name},
 "Favorit": {bool}
}
```

Получение значений
```
Get /api/ListenedMusics -Возращает весь массив прослушанной музыки

Get /api/ListenedMusics/{id} -Возращает записи по идентификатору. Где {id} идентификатор записи.
```

Изменение записи
```
Put /api/ListenedMusics/{id} -Где {id} идентификатор записи.

{
"Id": {id},
"MusicName": {name}, 
"Favorit": {bool}
}

```
*Удаление записи
```
Delete /api/ListenedMusics/{id} - Где {id} идентификатор записи.
```

# Апи Новостной ленты:

* Создание записи:

```
Post  /api/NewsModels
{
    "PublicationDay": {date},
    "PublicationTime": {time},
    "PostAuthor":{username},
    "PostTitle": {title},
    "PostContent": {postcontent},
    "PostPicture": {picture}
}
```

* Получение значений
```
Get /api/NewsModels - Возвращает все записи новостной ленты

Get /api/NewsModels/{id} - Возвращает пост по идентификатору. Где {id} идентификатор записи.
```

* Изменение записи
```
Put /api/NewsModels/{id} -Где {id} идентификатор записи.

{
    "PostId": {id},
    "PublicationDay": {date},
    "PublicationTime": {time},
    "PostAuthor":{username},
    "PostTitle": {title},
    "PostContent": {postcontent},
    "PostPicture": {picture}
}

```
* Удаление записи
```
Delete /api/NewsModels/{id} - Где {id} идентификатор записи.
```

# Апи для профиля:

* Получение профиля
```
Get /api/ProfileModels/{username} - Возвращает профиль по username;
```