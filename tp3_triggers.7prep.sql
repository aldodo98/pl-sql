drop table STATS_zhiao;
create table  STATS_zhiao (
    TypeMaj varchar(10),
    NbMaj number(9,4),
    Date_derniere_Maj date
    );


insert into STATS_zhiao values('INSERT',0,NULL);
insert into STATS_zhiao values('UPDATE',0,NULL);
insert into STATS_zhiao values('DELETE',0,NULL);


