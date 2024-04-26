## top_clock

Clock4 is designed similarly to Clock1, but there is a difference in the instance.

Clock1 has a instance of one_sec_generator in top_clock only. However, Clock4 has many instance such as sec_gen, min_gen, hour_gen and one_sec_generator and these affect Size Optimizaion.

Instanced module shares same logic if it exists, The complier recognizes that and minimizes duplication of it. 

As a result, this lowers the usage of LUT.

You can check that Clock4 has about half the LUT usage of Clock1. 

### LUT:49

![clock4](https://github.com/Kangj2min/Clock/assets/167446954/d4e50d59-3f6f-473f-b6ba-c99979515831)
