//+------------------------------------------------------------------+
//|                                                   Stochastic.mq5 |
//|                                                         gmakhobe |
//|                      https://github.com/gmakhobe/mql5-supertrend |
//+------------------------------------------------------------------+
#property copyright "gmakhobe"
#property link      "https://github.com/gmakhobe/mql5-supertrend"
#property version   "1.00"
#property indicator_separate_window

// Indicator Init
int OnInit()
{
   return(INIT_SUCCEEDED);
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

