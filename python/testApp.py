import streamlit as st
import mysql.connector
import pandas as pd

st.set_page_config(page_title="Game Tracker", layout="wide")
st.title("🎮 Game Tracker Database")
st.header("Player Dashboard")
st.subheader("Your Recent Games")
st.write("Welcome to the database. Use the menu to navigate.")

fake_db_results = [
    {"GameID": 1, "Name": "Zelda", "AverageScore": 9.5},
    {"GameID": 2, "Name": "Elden Ring", "AverageScore": 9.8}
]

# Option A: Interactive Table (Users can sort columns and scroll)
st.dataframe(fake_db_results)

# Option B: Static Table (Good for small, simple lists)
st.table(fake_db_results)

st.sidebar.title("Navigation")
view = st.sidebar.radio("Go to:", ["Home", "Add Game", "Rate Game"])

@st.cache_resource
def init_connection():
    # Replace these with your actual MySQL credentials!
    return mysql.connector.connect(
        host="127.0.0.1",
        port=3306,
        user="root",
        password="secretPasword123",
        database="GameTracker"
    )

try:
    conn = init_connection()
    cursor = conn.cursor(dictionary=True) # dictionary=True makes results easier to read
    st.success("Connected to database successfully!")
except Exception as e:
    st.error(f"Could not connect to database: {e}")
    st.stop() # Stops the app if the database isn't running

    st.sidebar.title("Navigation")
    view = st.sidebar.radio("Choose Perspective:", ["Player View", "Developer View"])

    st.subheader("Rate a Game")

# Create a form container
with st.form("rating_form"):
    # Input fields
    player_id = st.number_input("Your Player ID", min_value=1, step=1)
    game_id = st.number_input("Game ID to Rate", min_value=1, step=1)
    
    # A slider is perfect for your 1-10 scoring rule!
    score = st.slider("Your Score", min_value=1, max_value=10, value=5)
    
    # The submit button
    submitted = st.form_submit_button("Submit Rating")
    
    if submitted:
        # This is where you would put your INSERT query!
        # cursor.execute("INSERT INTO HasPlayed ...")
        st.success(f"Successfully rated Game {game_id} with a score of {score}!")