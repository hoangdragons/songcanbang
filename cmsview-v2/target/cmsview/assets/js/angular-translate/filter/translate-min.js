angular.module("pascalprecht.translate").filter("translate",translateFilterFactory);function translateFilterFactory(b,a){var c=function(d,f,e,g){if(!angular.isObject(f)){f=b(f)(this)}return a.instant(d,f,e,g)};if(a.statefulFilter()){c.$stateful=true}return c}translateFilterFactory.displayName="translateFilterFactory";