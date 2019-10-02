CREATE USER useradmin with PASSWORD 'lozinka123';
create database church owner useradmin;
\c church
create table dioceses (
    uid char(30) UNIQUE NOT NULL PRIMARY KEY,
    name varchar(30) UNIQUE not null,
);

insert into diocese (uid, name) values
    ('5L62ELIbTGUaaNTKIEZuFyns05crmR', 'Varaždinska biskupija'),
    ('5L62ELIbTGUaaNTKIEZuFyns05crma', 'Sisačka biskupija'),
    ('5L62ELIbTGUaaNTKIEZuFyns05crmb', 'Zagrebačka nadbiskupija'),
    ('5L62ELIbTGUaaNTKIEZuFyns05crmc', 'Bjelovarko-križevačka biskupija'),
    ('5L62ELIbTGUaaNTKIEZuFyns05crmd', 'Dubrovačka biskupija');

create table deaneries (
    uid char(30) UNIQUE NOT NULL PRIMARY KEY,
    name varchar(30) UNIQUE not null,
    diocese_id char(30),
)

insert into deaneries (uid, name, diocese_id) values 
    ('DL62ELIbTGUaaNTKIEZuFyns05crmR', 'Štrigovski Dekanat', '5L62ELIbTGUaaNTKIEZuFyns05crmR'),
    ('DL62ELIbTGUaaNTKIEZuFyns05crma', 'Čakovečki Dekanat', '5L62ELIbTGUaaNTKIEZuFyns05crmR'),
    ('DL62ELIbTGUaaNTKIEZuFyns05crmb', 'Preloški Dekanat', '5L62ELIbTGUaaNTKIEZuFyns05crmR'),
    ('DL62ELIbTGUaaNTKIEZuFyns05crmc', 'Trešnjevački Dekanat', '5L62ELIbTGUaaNTKIEZuFyns05crmb');

create table parishes (
    uid char(30) UNIQUE NOT NULL PRIMARY KEY,
    name varchar(30) UNIQUE not null,
    deanery_id char(30),
)

insert into parishes (uid, name, deanery_id) values 
    ('PL62ELIbTGUaaNTKIEZuFyns05crmR', 'Župa Štrigova', 'DL62ELIbTGUaaNTKIEZuFyns05crmR'),
    ('PL62ELIbTGUaaNTKIEZuFyns05crma', 'Župa Sveti Juraj na Bregu', 'DL62ELIbTGUaaNTKIEZuFyns05crmR'),
    ('PL62ELIbTGUaaNTKIEZuFyns05crmb', 'Župa Nedelišće', 'DL62ELIbTGUaaNTKIEZuFyns05crmR'),
    ('PL62ELIbTGUaaNTKIEZuFyns05crmc', 'Župa Pribislavec', 'DL62ELIbTGUaaNTKIEZuFyns05crma'),
    ('PL62ELIbTGUaaNTKIEZuFyns05crmd', 'Župa Blažene Djevice Marije Pomoćnice', 'DL62ELIbTGUaaNTKIEZuFyns05crmc');

create table writers {
    uid char(30) UNIQUE NOT NULL PRIMARY KEY,
    username varchar(30) not null UNIQUE,
    password varchar(60) not null,
    first varchar(30) not null,
    last varchar(30) not null,
    title varchar(30),
    in_charge_of_community_id char(30) not null,
}
insert into writers (uid, username, password, first, last, title, in_charge_of_community_id) values
    ('PL62ELIbTGUaaNTKIEZuFyns05asdf', 'kuhar', 'lozinka123', 'Kristjan', 'Kuhar', 'dr.sc.', 'PL62ELIbTGUaaNTKIEZuFyns05crmR'),
    ('PL62ELIbTGUaaNTKIEZuFyns05asdd', 'sv.Juraj', 'lozinka123', 'Josko', 'Jozic', 'laik', 'PL62ELIbTGUaaNTKIEZuFyns05crmR'),
    ('PL62ELIbTGUaaNTKIEZuFyns05asds', 'varazdinskaB', 'lozinka123', 'Augustin', 'od Hippona', 'biskup', '5L62ELIbTGUaaNTKIEZuFyns05crmR'),
    ('PL62ELIbTGUaaNTKIEZuFyns05asda', 'strigovskiDekanat', 'lozinka123', 'Franjo', 'Asiski', 'vlc', 'DL62ELIbTGUaaNTKIEZuFyns05crmR');

create table articles {
    uid char(30) UNIQUE NOT NULL PRIMARY KEY,
    title varchar(30) not null,
    content text not null,
    create_at timestamp not null default now(),
    author char(30) not null
}

insert into articles (uid, title, content, author) values
(
    'clk2ELIbTGUaaNTKIEZuFyns05asda', 
    'O Čudima i kako ih izmoliti', 
    `Zašto ne bi molio Gospodina da te ozdravi ako hoće? Ako ozdravljenja nema, onda čovjek traži duhovnu snagu i odgovor da bi nosio i razumio svoj križ, ali nikada unaprijed ne smije reći – to tako mora biti. Tko kaže da tako mora biti? Kod Boga nema fatalizma. Njegova je milost neiscrpna.

Nema čovjeka koji u svom životu ne traži ili ne očekuje neko čudo. Priželjkujemo ih podsvjesno više nego svjesno, i kad u njih vjerujemo, opet na neki način na racionalnoj razini sumnjamo. Čuda se rijetko događaju, ali se ipak događaju. Čak su i sportska čuda rijetka. Obično budu neočekivana, iznenadna, kad im se najmanje nadamo. Ponekad čuda vjere i ne prepoznajemo. Previdimo ih, podcijenimo, ako stvari ne gledamo duhovnim očima. Formu i oblik vidimo, ali nam izmakne suština. Govor čuda je najtajanstvenije očitovanje Boga. Zaista, tko ne bi želio vidjeti i doživjeti neko čudo u svom životu? No čuda se ne događaju na način kako bi mi htjeli ili očekivali. Ako bismo ih mogli predvidjeti, onda ne bi bila čuda. Ona su nepredvidljiva. Zato i jesu u domeni božanskoj. Nenajavljena su i dolaze kao mana s neba klonulom narodu u pustinji.

„No čuda se ne događaju na način kako bi mi htjeli ili očekivali. Ako bismo ih mo-gli predvidjeti, onda ne bi bila čuda. Ona su nepredvidljiva.“
Što je uopće čudo? Nije samo riječ o tomu da Bog u određenim slučajevima „suspendira“ prirodne zakone, da učini izuzetak ili ih premosti preko nekih drugih dimenzija nama nepoznatih i nevidljivih. Ili da se očituje smrtniku u nekoj neobičnoj teofaniji. Ili da slijepi progledaju, a hromi prohodaju. Da nestane tumor preko noći. Da čovjek oživi. Ta čuda jesu spektakularna, ali još uvijek nedovoljna za one najtvrdokornije sumnjivce. Bog ne koristi čuda da bi uvjeravao. Nitko zapravo i ne zna pravu narav i smisao čuda jer čovjek Božju otajstvenost nikada ne može u potpunosti dokučiti, može je iskusiti, racionalizirati na neki način, razviti teološku misao o njoj – ali tko može racionalno objasniti i razumjeti najveće čudo, a to je Kristovo prisuće u Euharistiji? Ako mu samo racionalno pristupamo, bez dara i milosti vjere, bez srca i nutarnjeg uvida koji nam se otvara kroz dimenzije sakramentalnoga života, ali i kroz sva naša životna iskustva od ljubavi do patnje i natrag, onda u tomu nećemo vidjeti ništa više osim puke simbolike ili teološke apstrakcije.

„Čudo je znak, čudo je poziv, upozorenje, Božja zagonetka, parabola, prispodoba postavljena na pozornicu naše egzistencije, da nas potakne na razmišljanje, da nas potrese, da nas probudi.“
Bog se služi raznim znakovima i očitovanjima onkraj ljudskog razuma da bi nas podsjetio na čudesnost otajstava naše katoličke vjere. Jedino u tomu može biti smisao i vidljivih pretvorbi vina u Krv ili hostije u Tijelo. No rekao bih da je još najveće čudo preobražaj ljudskoga srca koje se time postiže, buđenje čovjeka iz samrtnog sna – čudo je iznenađenje koje našoj uspavanosti priređuje prodor duhovnog i transcendentnog u naš materijalni svijet. Čudo je znak, čudo je poziv, upozorenje, Božja zagonetka, parabola, prispodoba postavljena na pozornicu naše egzistencije, da nas potakne na razmišljanje, da nas potrese, da nas probudi.`,
    'PL62ELIbTGUaaNTKIEZuFyns05asds'
),
(
    'clk2ELIbTGUaaNTKIEZuFyns05asdb', 
    'Lorem Ipsum', 
    `Zašto ne bi molio Gospodina da te ozdravi ako hoće? Ako ozdravljenja nema, onda čovjek traži duhovnu snagu i odgovor da bi nosio i razumio svoj križ, ali nikada unaprijed ne smije reći – to tako mora biti. Tko kaže da tako mora biti? Kod Boga nema fatalizma. Njegova je milost neiscrpna.

Nema čovjeka koji u svom životu ne traži ili ne očekuje neko čudo. Priželjkujemo ih podsvjesno više nego svjesno, i kad u njih vjerujemo, opet na neki način na racionalnoj razini sumnjamo. Čuda se rijetko događaju, ali se ipak događaju. Čak su i sportska čuda rijetka. Obično budu neočekivana, iznenadna, kad im se najmanje nadamo. Ponekad čuda vjere i ne prepoznajemo. Previdimo ih, podcijenimo, ako stvari ne gledamo duhovnim očima. Formu i oblik vidimo, ali nam izmakne suština. Govor čuda je najtajanstvenije očitovanje Boga. Zaista, tko ne bi želio vidjeti i doživjeti neko čudo u svom životu? No čuda se ne događaju na način kako bi mi htjeli ili očekivali. Ako bismo ih mogli predvidjeti, onda ne bi bila čuda. Ona su nepredvidljiva. Zato i jesu u domeni božanskoj. Nenajavljena su i dolaze kao mana s neba klonulom narodu u pustinji.

„No čuda se ne događaju na način kako bi mi htjeli ili očekivali. Ako bismo ih mo-gli predvidjeti, onda ne bi bila čuda. Ona su nepredvidljiva.“
Što je uopće čudo? Nije samo riječ o tomu da Bog u određenim slučajevima „suspendira“ prirodne zakone, da učini izuzetak ili ih premosti preko nekih drugih dimenzija nama nepoznatih i nevidljivih. Ili da se očituje smrtniku u nekoj neobičnoj teofaniji. Ili da slijepi progledaju, a hromi prohodaju. Da nestane tumor preko noći. Da čovjek oživi. Ta čuda jesu spektakularna, ali još uvijek nedovoljna za one najtvrdokornije sumnjivce. Bog ne koristi čuda da bi uvjeravao. Nitko zapravo i ne zna pravu narav i smisao čuda jer čovjek Božju otajstvenost nikada ne može u potpunosti dokučiti, može je iskusiti, racionalizirati na neki način, razviti teološku misao o njoj – ali tko može racionalno objasniti i razumjeti najveće čudo, a to je Kristovo prisuće u Euharistiji? Ako mu samo racionalno pristupamo, bez dara i milosti vjere, bez srca i nutarnjeg uvida koji nam se otvara kroz dimenzije sakramentalnoga života, ali i kroz sva naša životna iskustva od ljubavi do patnje i natrag, onda u tomu nećemo vidjeti ništa više osim puke simbolike ili teološke apstrakcije.

„Čudo je znak, čudo je poziv, upozorenje, Božja zagonetka, parabola, prispodoba postavljena na pozornicu naše egzistencije, da nas potakne na razmišljanje, da nas potrese, da nas probudi.“
Bog se služi raznim znakovima i očitovanjima onkraj ljudskog razuma da bi nas podsjetio na čudesnost otajstava naše katoličke vjere. Jedino u tomu može biti smisao i vidljivih pretvorbi vina u Krv ili hostije u Tijelo. No rekao bih da je još najveće čudo preobražaj ljudskoga srca koje se time postiže, buđenje čovjeka iz samrtnog sna – čudo je iznenađenje koje našoj uspavanosti priređuje prodor duhovnog i transcendentnog u naš materijalni svijet. Čudo je znak, čudo je poziv, upozorenje, Božja zagonetka, parabola, prispodoba postavljena na pozornicu naše egzistencije, da nas potakne na razmišljanje, da nas potrese, da nas probudi.`,
    'PL62ELIbTGUaaNTKIEZuFyns05asda'
),
