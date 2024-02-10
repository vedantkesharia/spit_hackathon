from flask import Flask, jsonify, request
import pandas as pd
import pickle

app = Flask(__name__)

# Load the trained model
with open('model.pkl', 'rb') as model_file:
    model = pickle.load(model_file)

# Assuming df_monthly is already loaded and preprocessed
# Let's assume you have a CSV file named 'monthly_data.csv' containing your monthly data
df_monthly = pd.read_csv('Monthly_data_cmo.csv')  # Load your monthly data here

def get_prices(commodity, apmc):
    global df_monthly
    
    # Extract relevant data for the given commodity and APMC
    data = df_monthly.loc[(df_monthly['Commodity'] == commodity) & (df_monthly['APMC'] == apmc)]
    return data.to_json(orient='records')

@app.route('/get_prices', methods=['GET'])
def send_prices():
    # Get commodity and APMC from frontend request
    commodity = request.args.get('commodity')
    apmc = request.args.get('apmc')
    
    # Get prices data for the specified commodity and APMC
    prices_data = get_prices(commodity, apmc)
    
    return jsonify(prices_data)

if __name__ == '__main__':
    app.run(debug=True)
