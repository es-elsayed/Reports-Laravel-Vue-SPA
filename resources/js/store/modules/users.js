import axios from 'axios'
import * as types from '../mutation-types'

// state
export const state = {
  users: null,
  user: null
}

// getters
export const getters = {
  all: state => state.users,
  show: state => state.user
}

// mutations
export const mutations = {
  [types.FETCH_USERS] (state, { users }) {
    state.users = users
  },
  [types.FETCH_USER] (state, { user }) {
    state.user = user
  }
}

// actions
export const actions = {
  async fetchUsers ({ commit }) {
    try {
      const { data } = await axios.get('/api/users')

      commit(types.FETCH_USERS, { users: data.data })
    } catch (e) {
      console.log(e)
    }
  },
  async fetchUser ({ commit }, { id }) {
    try {
      const { data } = await axios.get(`/api/users/${id}`)

      commit(types.FETCH_USER, { user: data })
    } catch (e) {
      console.log(e)
    }
  }
}
