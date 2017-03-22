select a.experiment, a.approach, a.`time`, sum(b.score) as `total score`
from result a, result b
where a.experiment = 13
and b.experiment = 13
and a.`time` >= b.`time`
and a.approach = b.approach
and a.instance = b.instance
and a.location = b.location
and a.provider = b.provider
and a.`user` = b.`user`
and a.wsn = b.wsn
group by a.experiment, a.approach, a.`time`