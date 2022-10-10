//+------------------------------------------------------------------+
//|                                                   Stochastic.mq5 |
//|                                                         gmakhobe |
//|                      https://github.com/gmakhobe/mql5-supertrend |
//+------------------------------------------------------------------+
#property copyright "gmakhobe"
#property link      "https://github.com/gmakhobe/mql5-supertrend"
#property version   "1.00"
#property indicator_separate_window
// Indicator Input
input int kPeriod = 5;
input int dPeriod = 3;
input int slowing = 3;

string pairSymbol = Symbol();

int stochasticHandler;

MqlParam mqlParams[];

// Indicator Init
int OnInit()
{
   
   return (stochasticIndicatorInit(mqlParams, pairSymbol, stochasticHandler, kPeriod, dPeriod, slowing) ? INIT_SUCCEEDED : INIT_FAILED);
}

// Logic Function
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
{
   return(rates_total);
}

bool stochasticIndicatorInit(
   MqlParam& _mqlParams[], string _pairSymbol, 
   int& _stochasticHandler, int _kPeriod, int _dPeriod, int _slowing)
{
   int _paramCount = 5;
   ArrayResize(_mqlParams, _paramCount);

   if (_pairSymbol == NULL) Symbol();

   for(int i=0; i < _paramCount; i++)
   {
      _mqlParams[i].type = TYPE_INT;   
   }

   _mqlParams[0].integer_value = _kPeriod; //kperiod - the value affecting the k percentage of the stochastic
   _mqlParams[1].integer_value = _dPeriod; //dperiod - the value affecting the cross over of the 3 day SMA with K
   _mqlParams[2].integer_value = _slowing; //smoothing value
   _mqlParams[3].integer_value = MODE_SMA; // Simple averaging value
   _mqlParams[4].integer_value = PRICE_CLOSE;
   _stochasticHandler = IndicatorCreate(_pairSymbol, PERIOD_CURRENT, IND_STOCHASTIC, _paramCount, _mqlParams);

   if (_stochasticHandler == INVALID_HANDLE)
   {
      Print("EA Failed to create a moving average!");
      return false;
   }
   return true;
}

