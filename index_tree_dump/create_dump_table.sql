create table test(text varchar2(4000), lineno number) organization external
(
    default directory tracedir
    access parameters (
       records delimited by newline         CHARACTERSET 'WE8MSWIN1252'
        fields terminated by '!'
        missing field values are null
                (
        text char(4000),
        lineno recnum
        )
    )
    location('ORCLCDB_ora_14932_TREEDUMP2.trc')
);
