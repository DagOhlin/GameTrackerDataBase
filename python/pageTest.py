import streamlit as st

st.title("Game Tracker Flow Example")

# 1. Setting up "Memory" for the current logged-in user
if 'current_user' not in st.session_state:
    st.session_state.current_user = "No one logged in yet"

# 2. The Navigation (This variable controls the flow)
view = st.sidebar.radio("Choose your perspective:", ["Player View", "Developer View"])

st.sidebar.write("---")
st.sidebar.write(f"**Current User:** {st.session_state.current_user}")


# 3. The Flow Control
if view == "Player View":
    st.header("👤 Welcome, Player!")
    
    # Let the user type their name
    player_name = st.text_input("Who are you?")
    if st.button("Log In"):
        # Save their name to the "backpack" so it survives the rerun!
        st.session_state.current_user = player_name
        st.rerun() # Forces an immediate rerun to update the sidebar

elif view == "Developer View":
    st.header("🛠️ Welcome, Developer!")
    st.write("You are in the secret developer area.")
    
    if st.button("Add Fake Game"):
        st.success("Pretend a game was just added to the database!")