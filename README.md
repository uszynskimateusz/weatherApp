# Weather App

Prostej aplikacja do sprawdzania prognozy pogody z wykorzystaniem darmowej usługi AccuWeather.

Na pierwszym widoku można wyszukać miasto dla którego chce się zobaczyć prognozę pogody, a nazwa miejscowości jest walidowana przy pomocy wyrażenia regularnego.

Wyszukiwarka nie przyjmuje liczb, znaków specjalnych, ale obsługuje polskie znaki.

Dopasowane miasta widoczne są na liście. 

Po wybraniu miasta pokazuje nam się widok z temperatura, najniższą temperaturą, prędkością wiatru, ilością opadów deszczu czy też śniegu.

Pokazana jest również prognoza pogody na następne dni.

Kolor fontu temperatury ma różnić się w zależności od stopni:
- poniżej 10 stopni Celsjusza kolor niebieski
- między 10 a 20 stopni kolor czarny
- powyżej 20 kolor czerwony
 
Na pierwszym ekranie znajduję się również lista historią wyszukiwania.

Nawigacja opiera się na MVVM-C.

Zostały dodane testy snapshotowe.
