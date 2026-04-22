import streamlit as st
import mysql.connector
import pandas as pd

st.set_page_config(page_title="Game Tracker", layout="wide")
st.title("Game Tracker Database")




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
    cursor = conn.cursor(dictionary=True) 
    st.success("Connected to database successfully")
except Exception as e:
    st.error(f"Could not connect to database: {e}")
    st.stop() 

    



view = st.sidebar.radio("Choose your perspective:", ["Player View", "Developer View", "Data View"])


if view == "Player View":
    if 'current_user' not in st.session_state:
        st.session_state.current_user = -1

    st.header("Welcome, Player!")
    
    if st.session_state.current_user == -1:


        player_name = st.text_input("Who are you?")
        if st.button("Log In"):

            query = "SELECT PlayerID FROM Players WHERE Name = %s"
            cursor.execute(query, (player_name,))
            player_ID = cursor.fetchall()
            if player_ID:
                st.session_state.current_user = player_ID[0]["PlayerID"]
                st.rerun() 
            else:
                st.error(f"could not find player, create acount instead")
    else:
        # get user name, not sure if i should store instead
        query = "SELECT Name FROM Players WHERE PlayerID = %s"
        cursor.execute(query, (st.session_state.current_user,))
        player_name = cursor.fetchall()
        st.write("You are loged in as user", player_name[0]["Name"])
        if st.button("Log out"):
            st.session_state.current_user = -1
            st.rerun() 
        
        st.sidebar.write("---")
        subView = st.sidebar.radio("Player options:", ["your games", "add game"])

        if subView == "your games":
            st.header("your games")
            query = "SELECT Games.Name FROM HasPlayed INNER JOIN Games ON HasPlayed.GameID = Games.GameID WHERE HasPlayed.PlayerID = %s"
            cursor.execute(query, (st.session_state.current_user,))
            played_games = cursor.fetchall()
            st.table(played_games)


        elif subView == "add game":
            st.header("add game")
        


        


        

elif view == "Developer View":
    st.header("Welcome, Developer!")
    if 'current_developer' not in st.session_state:
        st.session_state.current_developer = -1
    
    if st.session_state.current_developer == -1:


        player_name = st.text_input("Who are you?")
        if st.button("Log In"):
            st.session_state.current_developer = player_name
            st.rerun() 
    else:
        st.write("You are loged in as user", st.session_state.current_developer)
        if st.button("Log out"):
            st.session_state.current_developer = -1
            st.rerun() 

elif view == "Data View":
    st.header("Welcome to data view")

    cursor.execute("SELECT GameID, Name FROM Games")
    all_games = cursor.fetchall()
    st.table(all_games)

    cursor.execute("SELECT PlayerID, Name FROM Players")
    all_users = cursor.fetchall()
    st.table(all_users)
