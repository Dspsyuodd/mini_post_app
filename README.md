# mini_post_app

Скачать apk можно по [ссылке](https://drive.google.com/file/d/1vtN8paO6BimMXKtDWRG9LIe8XCp-a-Jj/view?usp=sharing)

Для запуска:
Поставить [flutter](https://docs.flutter.dev/get-started/install)

Если запускать через VSCode, нужны расширения Dart и Flutter.
После установки расширений, если открыть проект, vscode предложит поставить необходимые для билда sdk

Через VSCode открыть весь проект, выбрать эмулятор и запустить сборку

Через XCode открыть папку ios и запустить сборку




## [Core](lib/src/core/)
Общий код для приложения и утилиты

## [Api](lib/src/api/)
Api calls, на Dio

## [Domain](lib/src/domain/)
PostProvider - загрузка постов и управление состоянием
PostPageController - переключение страниц через BottomNavi

## [Models](lib/src/models/)
Используемые сущности

## [DI](lib/src/di.dart)
Зависимости на get_it

## [Ui](lib/src/ui/)
### [Pages](lib/src/ui/pages/)
Экраны приложения
### [Widgets](lib/src/ui/widgets/)
Виджеты


## [Tests](test/lib/)
Тесты на mokito
