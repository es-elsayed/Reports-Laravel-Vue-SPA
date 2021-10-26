import axios from 'axios'
import * as types from '../mutation-types'

// state
export const state = {
  tasks: null,
  currentPage: null,
  lastPage: null,
  task: null
}

// getters
export const getters = {
  all: state => state.tasks,
  currentPage: state => state.currentPage,
  lastPage: state => state.lastPage,
  show: state => state.task
}

// mutations
export const mutations = {
  [types.FETCH_TASKS](state, { tasks }) {
    state.tasks = tasks.data
  },
  [types.FETCH_TASK](state, { task, lastPage, currentPage }) {
    state.task = task
    // state.sharedProjects = sharedProjects
    state.lastPage = lastPage
    state.currentPage = currentPage
    // state.task = task.data.sharedProject
  }
}

// actions
export const actions = {
  async fetchTasks({ commit }) {
    try {
      const { data } = await axios.get('/api/tasks')

      commit(types.FETCH_TASKS, { tasks: data })
    } catch (e) {
      console.log(e)
    }
  },
  async fetchUserTasks({ commit }, { id }) {
    try {
      const { data } = await axios.get(`/api/reports/tasks/user/${id}`)
      commit(types.FETCH_TASK, {
        task: data.data,
        // sharedProjects: data.sharedProjects,
        lastPage: data.meta.last_page,
        currentPage: data.meta.current_page
      })
    } catch (e) {
      console.log(e)
    }
  },
  async fetchNextPage({ state, commit }, { id }) {
    try {
      const { data } = await axios.get(
        `/api/reports/tasks/user/${id}?page=${
          ++state.currentPage
        }`
      )
      commit(types.FETCH_TASK, {
        task: data.data,
        lastPage: data.meta.last_page,
        currentPage: data.meta.current_page
      })
    } catch (e) {
      console.log(e)
    }
  },
  async fetchPrevPage({ state, commit }, { id }) {
    try {
      const { data } = await axios.get(
        `/api/reports/tasks/user/${id}?page=${
          --state.currentPage
        }`
      )
      commit(types.FETCH_TASK, {
        task: data.data,
        lastPage: data.meta.last_page,
        currentPage: data.meta.current_page
      })
    } catch (e) {
      console.log(e)
    }
  }
}
