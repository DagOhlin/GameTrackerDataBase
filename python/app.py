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
                
        new_player_name = st.text_input("pick player name for new acount")
        player_age = st.number_input("age", min_value=0, max_value = 150, step=1)

        if st.button("create new player"):
            query = "SELECT PlayerID FROM Players WHERE Name = %s"
            cursor.execute(query, (new_player_name,))
            player_ID = cursor.fetchall()
            if player_ID:
                st.error(f"player username already exits, log in or pick another one")
            else:
                values = (new_player_name, player_age,)
                query = "INSERT INTO Players (Name, Age) VALUES (%s, %s)"
                cursor.execute(query, values)
                conn.commit()
                st.success(f"added {new_player_name}")


        
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
            query = "SELECT Games.Name, HasPlayed.Score FROM HasPlayed INNER JOIN Games ON HasPlayed.GameID = Games.GameID WHERE HasPlayed.PlayerID = %s"
            cursor.execute(query, (st.session_state.current_user,))
            played_games = cursor.fetchall()
            st.table(played_games)


        elif subView == "add game":
            st.header("add game")
            game_name = st.text_input("game name")
            score = st.number_input("score", min_value=0, max_value = 10, step=1)

            if st.button("Add Game To Collection"):
                values = (game_name, st.session_state.current_user, score, 0, "")
                return_values = cursor.callproc('AddGameToCollection', values)
                conn.commit()
                return_list = list(return_values.values())
                retun_val = return_list[3]
                return_message = return_list[4]
                if retun_val == 3:
                    st.error(return_message)
                elif retun_val == 0:
                    st.success(return_message)
                elif retun_val == 1:
                    st.error(return_message)
                elif retun_val == 2:
                    st.error(return_message)
                    query = "SELECT GameID, Name FROM Games WHERE Name = %s"
                    cursor.execute(query, (game_name,))
                    duplicate_games = cursor.fetchall()
                    st.table(duplicate_games)
            st.write("---")
            st.write("Add game using ID instead of name")
            
            
        
            selected_game_id = st.number_input("Enter the GameID", min_value=1, step=1)
            
            if st.button("Add By GameID"):
                query_insert = "INSERT INTO HasPlayed (GameID, PlayerID, Score) VALUES (%s, %s, %s)"
                cursor.execute(query_insert, (selected_game_id, st.session_state.current_user, score))
                conn.commit()
                st.success(f"Game ID {selected_game_id} added to collection with score {score}!")
        
        


        


        

elif view == "Developer View":
    if 'current_developer' not in st.session_state:
        st.session_state.current_developer = -1

    st.header("Welcome, Developer!")
    
    if st.session_state.current_developer == -1:


        developer_name = st.text_input("Who are you?")
        if st.button("Log In"):

            query = "SELECT DeveloperID FROM Developers WHERE Name = %s"
            cursor.execute(query, (developer_name,))
            developer_ID = cursor.fetchall()
            if developer_ID:
                st.session_state.current_developer = developer_ID[0]["DeveloperID"]
                st.rerun() 
            else:
                st.error(f"could not find developer, create acount instead")
        
        new_developer_name = st.text_input("developer name for new acount")
        if st.button("create new developer"):
            
            query = "SELECT DeveloperID FROM Developers WHERE Name = %s"
            cursor.execute(query, (new_developer_name,))
            developer_ID = cursor.fetchall()
            if developer_ID:
                st.error(f"developer name already, exists, log in or pick another name")

            else:
            
                values = (new_developer_name,)
                query = "INSERT INTO Developers (Name) VALUES (%s)"
                cursor.execute(query, values)
                conn.commit()
                st.success(f"added {new_developer_name}")


    else:
        # get user name, not sure if i should store instead
        query = "SELECT Name FROM Developers WHERE DeveloperID = %s"
        cursor.execute(query, (st.session_state.current_developer,))
        developer_name = cursor.fetchall()
        st.write("You are loged in as user", developer_name[0]["Name"])
        if st.button("Log out"):
            st.session_state.current_developer = -1
            st.rerun() 
        
        st.sidebar.write("---")
        subView = st.sidebar.radio("Developer options:", ["your games", "add game"])

        if subView == "your games":
            st.header("your games")
            query = "SELECT Games.Name, Games.AverageScore FROM Developers INNER JOIN Games ON Games.DeveloperID = Developers.DeveloperID WHERE Developers.DeveloperID = %s ORDER BY Games.AverageScore DESC"
            cursor.execute(query, (st.session_state.current_developer,))
            developed_games = cursor.fetchall()
            st.table(developed_games)


        elif subView == "add game":
            st.header("add game")
            game_name = st.text_input("game name")    
            if st.button("add game"):
                values = (game_name, st.session_state.current_developer,)
                query = "INSERT INTO Games (Name, DeveloperID) VALUES (%s, %s)"
                cursor.execute(query, values)
                conn.commit()
                st.success(f"added {game_name}")


elif view == "Data View":
    st.header("Welcome to data view")

    cursor.execute("SELECT Games.GameID, Games.Name AS GameName, Developers.Name AS DeveloperName FROM Games INNER JOIN Developers ON Developers.DeveloperID = Games.DeveloperID")
    all_games = cursor.fetchall()
    st.table(all_games)

    cursor.execute("SELECT PlayerID, Name, Age FROM Players")
    all_users = cursor.fetchall()
    st.table(all_users)

    cursor.execute("SELECT Developers.DeveloperID, Developers.Name, count(Games.DeveloperID) AS AmountOfGames FROM Developers LEFT JOIN Games ON Developers.DeveloperID = Games.DeveloperID GROUP BY Developers.Name, Developers.DeveloperID")
    all_users = cursor.fetchall()
    st.table(all_users)
