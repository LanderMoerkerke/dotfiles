" command! CsvFormat %s/\ *,\ */,/g

command! ReverseBuffer g/^/m0
command! JSONToPython %s/true/True/g | %s/false/False/g | %s/null/None/g
