## top_clock

### sec_generator.v
one_sec_generator is make 1 seconed depending on Frequency what i_freq then sec is increased.

when sec is 59 then sec_tic turn to high and it export module in order to wire on min_generator.v .

### min_generator.v

when sec_tic that wiring with sec_generator is high, min is increased. 

when min is 59 and sec_tic is high then min_tic is turn to high. it export module in order to wire on hour_generator.v .

### hour_generator.v

when min_tic that wiring with min_generator is highm hour is increased.

when sec is 59*59 m hour is increased. it is 1 hour count.


WNS 4.042 LUT:398/49
![clock2](https://github.com/Kangj2min/Clock/assets/167446954/6cacf1ec-2cd6-49ad-bee3-5175c0eb4636)
