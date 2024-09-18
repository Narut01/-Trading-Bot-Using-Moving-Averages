# -Trading-Bot-Using-Moving-Averages

This repository contains an automated trading bot developed in MQL5 for the MetaTrader 5 platform. The bot implements a simple but effective trading strategy based on the crossover of two Simple Moving Averages (SMA) and automatically executes buy and sell trades when predefined conditions are met.

## Features

- **Strategy**: Uses a 20-period fast SMA and a 200-period slow SMA to identify buy and sell signals based on crossover events.
- **Trade Execution**: Automatically places buy or sell orders with predefined stop-loss and take-profit levels.
- **Risk Management**: Each trade is secured with a 100-point stop-loss and take-profit, ensuring effective risk management.
- **Real-Time Operation**: The bot operates in real-time, constantly monitoring the market for new opportunities.

## How It Works

1. **SMA Crossover**: 
   - **Buy Signal**: Triggered when the 20-period fast SMA crosses above the 200-period slow SMA.
   - **Sell Signal**: Triggered when the 20-period fast SMA crosses below the 200-period slow SMA.
2. **Order Execution**: 
   - A buy order is placed when a crossover indicates a potential uptrend.
   - A sell order is placed when a crossover indicates a potential downtrend.
3. **Risk Control**:
   - Stop-loss and take-profit levels are automatically set 100 points away from the entry price to manage risk.

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/automated-trading-bot.git
