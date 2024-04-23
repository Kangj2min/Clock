## top_clock

Clock4 is designed similarly to Clock1. there is a difference between Clock4 and Clock1 is instance.

Clock1 has a instance of one_sec_generator in top_clock only.

But Clock4 has much instance what sec_gen, min_gen, hour_gen and one_sec_generator.

So . 성능측면에서 분석해보고 써야할듯?


clock4는 clock1과 비슷하게 설계되어 있지만 차이점이 존재한다. clock1은 top_clock에서 one_sec_generator만 인스턴스화 되어 있고 나머지는 인스턴스화 되어있지 않다

하지만 clock4는 top_clock 안의 one_sec_generator를 포함하여 sec_gen, min_gen , hour_gen 모두 인스턴스화 되어 있다.

clock1보다 가독성이 좋다.

