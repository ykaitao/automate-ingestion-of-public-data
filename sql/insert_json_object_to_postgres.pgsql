DECLARE jsonVariable VARCHAR(5000);


jsonVariable := '[{"state":"AK","reported":"14","total":"16","percentage_reporting":"87.5"}
,{"state":"AL","reported":"96","total":"97","percentage_reporting":"98.97"}
,{"state":"AR","reported":"83","total":"89","percentage_reporting":"93.26"}
,{"state":"AS","reported":"1","total":"1","percentage_reporting":"100.0"}
,{"state":"AZ","reported":"74","total":"77","percentage_reporting":"96.1"}
,{"state":"CA","reported":"354","total":"357","percentage_reporting":"99.16"}
,{"state":"CO","reported":"90","total":"91","percentage_reporting":"98.9"}
,{"state":"CT","reported":"32","total":"32","percentage_reporting":"100.0"}
,{"state":"DC","reported":"10","total":"10","percentage_reporting":"100.0"}
,{"state":"DE","reported":"8","total":"8","percentage_reporting":"100.0"}
,{"state":"FL","reported":"206","total":"210","percentage_reporting":"98.1"}
,{"state":"GA","reported":"140","total":"146","percentage_reporting":"95.89"}
,{"state":"GU","reported":"2","total":"2","percentage_reporting":"100.0"}
,{"state":"HI","reported":"24","total":"25","percentage_reporting":"96.0"}
,{"state":"IA","reported":"113","total":"117","percentage_reporting":"96.58"}
,{"state":"ID","reported":"45","total":"45","percentage_reporting":"100.0"}
,{"state":"IL","reported":"176","total":"180","percentage_reporting":"97.78"}
,{"state":"IN","reported":"125","total":"127","percentage_reporting":"98.43"}
,{"state":"KS","reported":"130","total":"137","percentage_reporting":"94.89"}
,{"state":"KY","reported":"94","total":"100","percentage_reporting":"94.0"}
,{"state":"LA","reported":"146","total":"149","percentage_reporting":"97.99"}
,{"state":"MA","reported":"73","total":"74","percentage_reporting":"98.65"}
,{"state":"MD","reported":"43","total":"50","percentage_reporting":"86.0"}
,{"state":"ME","reported":"33","total":"33","percentage_reporting":"100.0"}
,{"state":"MI","reported":"141","total":"144","percentage_reporting":"97.92"}
,{"state":"MN","reported":"126","total":"126","percentage_reporting":"100.0"}
,{"state":"MO","reported":"112","total":"116","percentage_reporting":"96.55"}
,{"state":"MS","reported":"99","total":"101","percentage_reporting":"98.02"}
,{"state":"MT","reported":"57","total":"60","percentage_reporting":"95.0"}
,{"state":"NC","reported":"110","total":"112","percentage_reporting":"98.21"}
,{"state":"ND","reported":"21","total":"46","percentage_reporting":"45.65"}
,{"state":"NE","reported":"92","total":"96","percentage_reporting":"95.83"}
,{"state":"NH","reported":"26","total":"26","percentage_reporting":"100.0"}
,{"state":"NJ","reported":"73","total":"74","percentage_reporting":"98.65"}
,{"state":"NM","reported":"40","total":"40","percentage_reporting":"100.0"}
,{"state":"NV","reported":"42","total":"46","percentage_reporting":"91.3"}
,{"state":"NY","reported":"159","total":"165","percentage_reporting":"96.36"}
,{"state":"OH","reported":"181","total":"184","percentage_reporting":"98.37"}
,{"state":"OK","reported":"120","total":"129","percentage_reporting":"93.02"}
,{"state":"OR","reported":"60","total":"60","percentage_reporting":"100.0"}
,{"state":"PA","reported":"176","total":"186","percentage_reporting":"94.62"}
,{"state":"PR","reported":"54","total":"58","percentage_reporting":"93.1"}
,{"state":"RI","reported":"11","total":"11","percentage_reporting":"100.0"}
,{"state":"SC","reported":"64","total":"66","percentage_reporting":"96.97"}
,{"state":"SD","reported":"57","total":"57","percentage_reporting":"100.0"}
,{"state":"TN","reported":"106","total":"114","percentage_reporting":"92.98"}
,{"state":"TX","reported":"445","total":"467","percentage_reporting":"95.29"}
,{"state":"UT","reported":"50","total":"52","percentage_reporting":"96.15"}
,{"state":"VA","reported":"86","total":"89","percentage_reporting":"96.63"}
,{"state":"VI","reported":"2","total":"2","percentage_reporting":"100.0"}
,{"state":"VT","reported":"14","total":"14","percentage_reporting":"100.0"}
,{"state":"WA","reported":"91","total":"91","percentage_reporting":"100.0"}
,{"state":"WI","reported":"132","total":"133","percentage_reporting":"99.25"}
,{"state":"WV","reported":"50","total":"51","percentage_reporting":"98.04"}
,{"state":"WY","reported":"26","total":"26","percentage_reporting":"100.0"}
,{"state":"zCW","reported":"4935","total":"5115","percentage_reporting":"96.48093841642229"}]';

INSERT INTO hospitals_reporting_percentage  
SELECT HospitalsTeportingPercentage.*
FROM OPENJSON (jsonVariable, '$')
  WITH (
    state VARCHAR(5) '$.state',
    reported INT '$.reported',
    total INT '$.total',
    percentage_reporting REAL '$.percentage_reporting'
  ) AS HospitalsTeportingPercentage;

-- PL/pgSQL - SQL Procedural Language: https://www.postgresql.org/docs/8.1/plpgsql.html
$$ LANGUAGE plpgsql;