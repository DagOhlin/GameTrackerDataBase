import streamlit as st
import mysql.connector
import pandas as pd

st.set_page_config(page_title="Game Tracker", layout="wide")
st.title("🎮 Game Tracker Database")




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

    



view = st.sidebar.radio("Choose your perspective:", ["Player View", "Developer View"])


if view == "Player View":
    if 'current_user' not in st.session_state:
        st.session_state.current_user = -1

    st.header("Welcome, Player!")
    
    if st.session_state.current_user == -1:


        player_name = st.text_input("Who are you?")
        if st.button("Log In"):
            st.session_state.current_user = player_name
            st.rerun() 
    else:
        st.write("You are loged in as user", st.session_state.current_user)

        

elif view == "Developer View":
    st.header("Welcome, Developer!")
    st.write("You are in the secret developer area.")
    
    if st.button("Add Fake Game"):
        st.success("Pretend a game was just added to the database!")    