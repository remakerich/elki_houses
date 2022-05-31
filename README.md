# elki_houses

![image](https://user-images.githubusercontent.com/85007290/171265653-51f605cb-a1aa-4015-af5b-7760349f7e14.png)

Тестовое задание
Необходимо написать простое приложение на flutter, для просмотра информации о домах в соответствии с макетами в figma. 

1. Загрузить список домов с сервера в виде json.
2. Показать пользователю экран со списком домов с возможностью фильтрации списка по типу дома (O-frame и A-frame).
3. По клику на дом пользователю показывается экран с карточкой дома. На данной странице у пользователя должна быть возможность пролистать изображения дома свайпом влево и вправо. По кнопке «Назад» пользователь возвращается к списку домов с сохраненным ранее фильтром по типу дома.

Ссылка для загрузки списка домов:
https://elki.rent/test/house.json

id - идентификатор дома;
name - название дома;
location - название локации;
description - краткое описание дома;
type - тип дома (o-frame или a-frame);
rating - рейтинг (от 0 до 5);
review_count - количество отзывов;
images - массив ссылок на изображения дома (может быть пустым);
price - стоимость аренды в сутки.



Макет экранов в figma:
https://www.figma.com/file/h3NeObC6wHNaVz9lbW2S7S/%D0%A2%D0%B5%D1%81%D1%82%D0%BE%D0%B2%D0%BE%D0%B5-%D0%B7%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5?node-id=0%3A1

# app launch
- `flutter pub get`
- `flutter pub run build_runner watch --delete-conflicting-outputs`
- start your Android or iOS virtual device
- `flutter run -d "name_of_your_device"`
