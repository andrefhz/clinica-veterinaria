Drop schema if exists prontuario_vet;
Create schema prontuario_vet;
use prontuario_vet;

Create Table especie (

	cd_especie int,
    nm_especie varchar(50),
    constraint pk_especie primary key (cd_especie)
);

Create Table animal (

	cd_animal int,
    nm_animal varchar(100),
    cd_especie int,
    constraint pk_animal primary key (cd_animal),
    constraint fk_animal_especie foreign key (cd_especie)
		references especie(cd_especie)
);

Create Table tratamento (
	cd_tratamento int,
    nm_tratamento varchar(100),
    ds_tratamento text,
    constraint pk_tratamento primary key (cd_tratamento)
);

Create Table prontuario (
	cd_animal int,
    cd_tratamento int,
    dt_tratamento datetime,
	ds_observacao text,
    constraint pk_prontuario primary key (cd_animal, cd_tratamento, dt_tratamento),
    constraint fk_prontuario foreign key (cd_animal)
		references animal (cd_animal),
    constraint fk_prontuario_tratamento foreign key (cd_tratamento) 
		references tratamento (cd_tratamento)
    
);

insert into especie values (1, 'Cachorro');
insert into especie values (2, 'Gato');
insert into especie values (3, 'Coelho');

insert into animal values (1, 'Meg', 1);
insert into animal values (2, 'Luna', 2);
insert into animal values (3, 'Bolinha', 3);

insert into tratamento values (101, 'Vacina Antirrábica', 'Proteção contra raiva');
insert into tratamento values (102, 'Vermifugação', 'Controle de vermes intestinais');
insert into tratamento values (103, 'Castração', 'Esterilização');

insert into prontuario values (1,101,'2024-08-30 11:30:00', 'Renover em 1 ano');
insert into prontuario values (1,102,'2024-08-30 11:35:00', 'Houve reação alérgica e foi administrado Apoquel 6g');
insert into prontuario values (2,101,'2024-09-30 16:30:00', null);
insert into prontuario values (2,103,'2024-02-10', 'Demorou para voltar da anestesia, mas nada preocupante');
insert into prontuario values (3,102,'2024-03-01', null);


