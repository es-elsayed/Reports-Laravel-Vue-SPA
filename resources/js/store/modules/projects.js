import axios from 'axios'
import * as types from '../mutation-types'

// state
export const state = {
  projects: null,
  project: null
}

// getters
export const getters = {
  all: state => state.projects,
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
  // ,
  // async fetchProject ({ commit }, { id }) {
  //   try {
  //     const { data } = await axios.get(`/api/projects/${id}`)

  //     commit(types.FETCH_PROJECT, { project: data.data })
  //   } catch (e) {
  //     console.log(e)
  //   }
  // }
}
