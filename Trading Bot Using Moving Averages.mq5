#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <Trade/Trade.mqh>
CTrade trade;

int OnInit(){


   return(INIT_SUCCEEDED);
}

void OnDeinit(const int reason){

   
}

void OnTick(){

   static datetime timestamp;
   datetime time = iTime(_Symbol,PERIOD_CURRENT,0);
   if(timestamp != time){
      
      timestamp = time;
      
      static int handlesSlowMa = iMA(_Symbol,PERIOD_CURRENT,200,0,MODE_SMA,PRICE_CLOSE);
      double slowMaArray[];
      CopyBuffer(handlesSlowMa,0,1,2,slowMaArray);
      ArraySetAsSeries(slowMaArray,true);
   
      static int handlesFastMa = iMA(_Symbol,PERIOD_CURRENT,20,0,MODE_SMA,PRICE_CLOSE);
      double fastMaArray[];
      CopyBuffer(handlesFastMa,0,1,2,fastMaArray);
      ArraySetAsSeries(fastMaArray,true);
   
      if(fastMaArray[0] > slowMaArray[0] && fastMaArray[1] < slowMaArray[1]){
         Print("Buy");
         double ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
         double sl = ask - 100 * SymbolInfoDouble(_Symbol,SYMBOL_POINT);
         double tp = ask + 100 * SymbolInfoDouble(_Symbol,SYMBOL_POINT);
         trade.Buy(0.01,_Symbol,ask,sl,tp,"This is the Buy Trade");
      }
   
      if(fastMaArray[0] < slowMaArray[0] && fastMaArray[1] > slowMaArray[1]){
         Print("Sell");
         double bid = SymbolInfoDouble(_Symbol,SYMBOL_BID);
         double sl = bid + 100 * SymbolInfoDouble(_Symbol,SYMBOL_POINT);
         double tp = bid - 100 * SymbolInfoDouble(_Symbol,SYMBOL_POINT);
         trade.Sell(0.01,_Symbol,bid,sl,tp,"This is the Sell Trade");
      }
 }  
}

