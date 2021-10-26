import axios from 'axios'
import * as types from '../mutation-types'

// state
export const state = {
  projects: null,
  shared: null,
  project: null
}

// getters
export const getters = {
  all: state => state.projects,
  shared: state => state.project,
  show: state => state.project
}

// mutations
export const mutations = {
  [types.FETCH_PROJECTS] (state, { projects }) {
    state.projects = projects
  },
  [types.FETCH_PROJECT] (state, { project }) {
    state.project = project
  }
}

// actions
export const actions = {
  async fetchProjects ({ commit }) {
    try {
      const { data } = await axios.get('/api/projects')

      commit(types.FETCH_PROJECTS, { projects: data })
    } catch (e) {
      console.log(e)
    }
  }
  ,
  async fetchSharedProject ({ commit }, { id }) {
    try {
      const { data } = await axios.get(`/api/projects/shared/user/${id}`)

      commit(types.FETCH_PROJECT, { project: data.data })
    } catch (e) {
      console.log(e)
    }
  }
}
