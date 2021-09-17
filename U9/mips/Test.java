package com.codility;

import java.util.stream.Stream;

class ProductionLineTester {

  private final ProductVerifier verifier;

  ProductionLineTester(ProductVerifier verifier) {
    this.verifier = verifier;
  }

  ProductLineTestReport test(Stream<Product> products) {
  long correctCnt=0;    
  long checkedExcCnt=0;   
  long uncheckedExcCnt=0; 
  long otherExcCnt=0;
  correctCnt=  products
    .filter(x -> x!=null)
    .count();
  products
    .filter(x -> x!=null)
    .filter(x -> !x.getStatus().equals("invalid"))
    .skip(10)
    .limit(20)
    .foreach(x->{
      try{
          verifier.verify(x)
      }catch(Exeption e){

      }
    })
    return new ProductLineTestReport(correctCnt,checkedExcCnt,uncheckedExcCnt,otherExcCnt);
  }

}