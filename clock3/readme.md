## top_clock

Overall, Clock3 is similar to Clock2 but the biggest diffrent thing is a way how to instance.  
전반적인 작동 원리는 clock2와 같지만 가장 큰 차이점이 있습니다. 그것은 바로 인스턴스의 방법입니다.

Clock2 contain instance of sec_gen, min_gen, and hour_gen but Clock3 isn't that way.
Clock2는 top_clock에 sec,min,hour 의 인스턴스를 모두 포함하고 있지만 Clock3는 그렇지 않습니다.

one_sec_generator is containng sec_gen and sec_gen include min_gen. and min_gen cover hour_gen. 
one_sec_generator는 sec_gen을 포함하고 있고, sec_gen은 min_gen을 포함합니다. 그리고 min_gen은 hour_gen을 포함합니다.

Like this, instance of Clock3 are made up of chains.
이처럼 인스턴스는 연쇄적으로 이루어져있습니다.


![clock3](https://github.com/Kangj2min/Clock/assets/167446954/98285d5c-b418-4247-b3cd-6b1ca2b79a9b)
