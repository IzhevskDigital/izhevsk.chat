Back on C# (.NET Core) 

#Апи прослушанной музыки:
*Создание записи:
Post  /api/ListenedMusics
{"MusicName": {name}, "Favorit": {bool}}

*Получение значений
Get /api/ListenedMusics -Возращает весь массив прослушанной музыки
Get /api/ListenedMusics/{id} -Возращает записи по идентификатору. Где {id} идентификатор записи.

* Изменение записи
Put /api/ListenedMusics/{id} -Где {id} идентификатор записи.
{"MusicName": {name}, "Favorit": {bool}}

*Удаление записи
Delete /api/ListenedMusics/{id} - Где {id} идентификатор записи.