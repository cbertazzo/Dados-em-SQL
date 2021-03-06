drop table TB_PAIS;
 
create table TB_PAIS (  
  id_pais number not null,
  nm_pais varchar2 (50) not null,  
  nr_populacao number,
  constraint pk_pais primary key (id_pais)  
);

insert into TB_PAIS values (101, 'India', null);
insert into TB_PAIS (id_pais, nm_pais) values (102, 'França');
insert into TB_PAIS (id_pais, nm_pais, nr_populacao) values (103, 'Reino Unido', 12000000);
insert into TB_PAIS (id_pais, nm_pais) values (104, 'Itália');


select * from TB_PAIS;

drop table TB_EQUIPE;

create table TB_EQUIPE (  
 id_equipe number not null primary key,
 nm_equipe varchar2 (50) not null,  
 id_pais number not null, 
 constraint fk_equipe_pais foreign key (id_pais) references TB_PAIS (id_pais) 
);


insert into TB_EQUIPE values (801, 'Renaut', 102);
insert into TB_EQUIPE values (802, 'Equipe Lotus', 103);
insert into TB_EQUIPE values (803, 'Force India', 101);
insert into TB_EQUIPE values (804, 'Brabhama', 103);
insert into TB_EQUIPE values (805, 'Benetton', 104);

select * from TB_EQUIPE;

drop table TB_PILOTO;

create table TB_PILOTO (
 id_piloto number GENERATED BY DEFAULT ON NULL AS IDENTITY,
 nm_piloto VARCHAR2(50),
 dt_nascimento DATE,
 id_pais number not null, 
 id_equipe number not null,
 constraint fk_piloto_pais foreign key (id_pais) references TB_PAIS (id_pais),
 constraint fk_piloto_equipe foreign key (id_equipe) references TB_EQUIPE (id_equipe),
 constraint pk_id_piloto primary key (id_piloto)
);



insert into TB_PILOTO (nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values ('Michael Schumacher', TO_DATE('15/04/1986', 'DD/MM/YYYY'), 104, 805);
insert into TB_PILOTO (nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values ('Daniel Ricciardo', TO_DATE('13/08/1990', 'DD/MM/YYYY'), 102, 801);
insert into TB_PILOTO (nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values ('Sergio Pérez', TO_DATE('01/02/1990', 'DD/MM/YYYY'), 101, 803);
insert into TB_PILOTO (nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values ('Nelson Piquet', TO_DATE('12/12/1989', 'DD/MM/YYYY'), 103, 804);

select * from TB_PILOTO;

drop table TB_CIRCUITO;

create table TB_CIRCUITO (
    id_circuito number not null primary key,
    nr_circuito varchar2 (50) not null,
    nr_extensao varchar2 (50) not null,
    id_pais number not null,
    constraint fk_id_circuito_pais foreign key (id_pais) references TB_PAIS (id_pais)
);

drop table TB_PROVA; 

create table TB_PROVA (
    id_prova number not null primary key,
    nm_situacao varchar2 (50) not null, 
    id_circuito number not null,
    constraint fk_id_circuito foreign key (id_circuito) references TB_CIRCUITO (id_circuito)
);

drop table TB_RESULTADO; 

create table TB_RESULTADO (
    id_resultado number not null primary key,
    id_prova number not null,
    id_piloto number not null,
    nr_tempo_prova varchar2 (50) not null,
    nr_coloc_final varchar2 (50) not null,
    nr_posicao_grid varchar2 (50) not null,
    nr_melhor_volta varchar2 (50) not null,
    constraint fk_id_prova foreign key (id_prova) references TB_PROVA (id_prova),
    constraint fk_id_piloto foreign key (id_piloto) references TB_PILOTO (id_piloto)
);



