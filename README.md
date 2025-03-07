# SocialNetworkAnalyzer

## Опис
SocialNetworkAnalyzer - це потужна платформа для аналізу даних соціальних мереж, яка включає модулі для збору даних, аналізу структури графів, візуалізації мереж та визначення ключових вузлів.

## Структура проекту
Проект розділений на кілька шарів для покращення читабельності та підтримуваності коду:

- **Data**: Дані для аналізу.
- **R**: Модулі для збору даних, аналізу графів та візуалізації.
- **www**: Користувацькі стилі CSS.
- **app.R**: Основний файл додатку Shiny.
- **DESCRIPTION**: Опис пакету.
- **NAMESPACE**: Експорт функцій.

## Встановлення
1. Клонуйте репозиторій:
    ```bash
    git clone <URL репозитарію>
    ```
2. Перейдіть до каталогу проекту:
    ```bash
    cd social_network_analyzer
    ```
3. Встановіть необхідні залежності:
    ```r
    install.packages(c("shiny", "httr", "jsonlite", "igraph", "visNetwork"))
    ```

## Запуск
Для запуску проекту виконайте наступну команду в R:
```r
shiny::runApp("app.R")
```

## Структура каталогів
```plaintext
social_network_analyzer/
├── R/
│   ├── data_collection.R
│   ├── graph_analysis.R
│   ├── visualization.R
│   └── ui.R
│   └── server.R
├── www/
│   └── custom.css
├── app.R
├── DESCRIPTION
├── NAMESPACE
└── README.md
```

## Опис компонентів
### R
- **data_collection.R**: Модуль для збору даних з соціальних мереж.
- **graph_analysis.R**: Модуль для аналізу структури графів та розрахунку центральностей.
- **visualization.R**: Модуль для створення візуалізацій з використанням `visNetwork`.
- **ui.R**: Файл, який визначає користувацький інтерфейс додатку Shiny.
- **server.R**: Файл, який визначає логіку сервера додатку Shiny.

### www
- **custom.css**: Користувацькі стилі CSS для додатку Shiny.

### Основні файли
- **app.R**: Основний файл додатку, який завантажує всі модулі та запускає Shiny додаток.
- **DESCRIPTION**: Опис пакету R.
- **NAMESPACE**: Файл для експорту функцій, які використовуються у пакеті.

## Ліцензія
Цей проект ліцензовано під ліцензією MIT. Для отримання додаткової інформації див. файл LICENSE.
