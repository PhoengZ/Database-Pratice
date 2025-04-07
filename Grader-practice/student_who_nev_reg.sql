select sname, major from Student
where sid not in (
    select sid from Registration
    where semester like '%2024%'
)