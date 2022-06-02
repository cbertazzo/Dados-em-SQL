
insert into TB_PILOTO (nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values ('Michael Schumacher', TO_DATE('15/04/1986', 'DD/MM/YYYY'), 104, 805);
insert into TB_PILOTO (nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values ('Daniel Ricciardo', TO_DATE('13/08/1990', 'DD/MM/YYYY'), 102, 801);
insert into TB_PILOTO (nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values ('Sergio Pérez', TO_DATE('01/02/1990', 'DD/MM/YYYY'), 101, 803);
insert into TB_PILOTO (nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values ('Nelson Piquet', TO_DATE('12/12/1989', 'DD/MM/YYYY'), 103, 804);


insert into TB_EQUIPE values (801, 'Renaut', 102);
insert into TB_EQUIPE values (802, 'Equipe Lotus', 103);
insert into TB_EQUIPE values (803, 'Force India', 101);
insert into TB_EQUIPE values (804, 'Brabhama', 103);
insert into TB_EQUIPE values (805, 'Benetton', 104);

insert into TB_PAIS values (101, 'India', null);
insert into TB_PAIS (id_pais, nm_pais) values (102, 'França');
insert into TB_PAIS (id_pais, nm_pais, nr_populacao) values (103, 'Reino Unido', 12000000);
insert into TB_PAIS (id_pais, nm_pais) values (104, 'Itália');


select tp.nm_pais,nm_piloto from TB_PAIS tp 
    join TB_PILOTO plt on plt.id_pais = tp.id_pais


select tp.nm_pais, count(nm_piloto) from TB_PAIS tp 
    join TB_PILOTO plt on plt.id_pais = tp.id_pais
    group by tp.nm_pais;

select extract(year from dt_nascimento) from tb_piloto
    order by dt_nascimento asc; 
   

select 
    plt.nm_piloto, 
    plt.id_pais,
    eqp.nm_equipe, 
    eqp.id_pais
from TB_PILOTO plt  
    left join TB_EQUIPE eqp 
        on eqp.id_equipe = plt.id_equipe
    join TB_PAIS tp 
        on tp.id_pais = eqp.id_pais

