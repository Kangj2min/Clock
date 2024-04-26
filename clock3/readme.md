## top_clock

Overall, Clock3 is similar to Clock2 but the biggest diffrent thing is a way how to instance.  

Clock2 contain instance of sec_gen, min_gen, and hour_gen but Clock3 isn't that way.

one_sec_generator is containng sec_gen and sec_gen include min_gen. and min_gen cover hour_gen. 

Like this, instance of Clock3 are made up of chains.

### LUT:109
![clock3](https://github.com/Kangj2min/Clock/assets/167446954/98285d5c-b418-4247-b3cd-6b1ca2b79a9b)
