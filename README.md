# FoodTracker  

Prosta aplikacja do mierzenia liczby spożytych kalorii w trakcie dnia.

## Instalacja:

Wymagane Ruby > 1.9:

```
bundle install
bundle exec rake db:seed
```

## Widoki:

* Diary - dziennik spożytych w danym dniu pokarmów. Automatyczne podliczanie wartości odżywczych i kalorii.
* Foods - baza danych możliwego pożywienia. Można dodawać nowe wpisy, kopiując informację z opakowania.
