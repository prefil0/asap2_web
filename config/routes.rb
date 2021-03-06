Rails.application.routes.draw do
  resources :exp_entries do 
      member do
      get :summary
    end
  end
  resources :provider_projects
  resources :providers
  resources :journals
  resources :articles do
    member do
      get :summary
    end
  end
  resources :identifier_types
  resources :sample_identifiers
  resources :geo_entries do
    member do
      get :summary
    end
  end
  resources :hca_projects
  resources :hcao_namespaces
  resources :hcao_terms
  resources :ensembl_subdomains
  resources :tmp_genes
  resources :gene_set_items
  resources :archive_statuses
  resources :fos
  resources :todo_types
  resources :todo_votes
  resources :todos do
    collection do
      get :get_roadmap
      post :add_del_thumb
    end
  end
  resources :annots do
    member do
      get :get_cats
      get :get_cat_details
    end
    collection do
    end
  end
  resources :data_types
  resources :upload_types
  resources :del_runs
  resources :active_runs
  resources :reqs
  resources :runs do
    member do
      get :get_de_gene_list
      get :get_ge_geneset_list
    end
  end
  resources :supports
  resources :std_methods
  resources :std_runs
  resources :correlations
  resources :trajectories
  resources :covariates
  resources :heatmaps
  resources :cell_filterings
  resources :gene_filterings
  resources :file_formats
  resources :comments
  resources :figures
  resources :filterings
  resources :normalizations
  resources :imputations
  resources :imputation_methods
  resources :genes do
    collection do
      get :search
      get :autocomplete
    end
  end

  resources :fus do
    member do
      get 'upload', to: 'fus#upload'
      patch 'upload', to: 'fus#do_upload'
      get 'resume_upload', to: 'fus#resume_upload'
      patch 'update_status', to: 'fus#update_status'
      get 'reset_upload', to: 'fus#reset_upload'
      post 'retrieve_data_from_url'
      post 'preparsing'
    end
  end


  resources :dim_reductions
  resources :gene_sets do
    collection do
      get :autocomplete
    end
  end

  resources :gene_enrichments do
    member do
      get :get_list
    end
    collection do
      post :filter_results
    end
  end
  resources :project_dim_reductions
  resources :filter_methods
  resources :norms
  resources :diff_exprs do
    member do
      get :list_genes
      get :get_selection
    end
    collection do
      post :filter_results
    end
  end

  resources :selections
  resources :clusters do
    member do
      get :to_tab
    end
  end
  
  resources :shares
  resources :statuses
  resources :steps
  resources :versions do
    collection do
      get :last_version
    end
  end
  resources :home do
    collection do
      get :test
      get :about
      get :file_format
      get :tutorial
      get :faq
      get :citation
      get :support
    end
  end
  resources :organisms
  devise_for :users
  resources :projects, param: :key do
    collection do
      post :upload_file
      get :get_cart
      get :form_select_input_data
      post :hca_preview
      get :hca_projects
      post :hca_download
    end
    member do
      post :set_public
      get :get_commands
      get :form_new_analysis
      get :form_new_metadata
      post :save_metadata_from_selection
      post :upd_cat_alias
      post :upd_sel_cats
      post :broadcast_on_project_channel
      get :live_upd
      get :parse_form
      patch :parse
      post :set_lineage_run_ids
      get :get_cells
      get :upload_form
      get :add_metadata
      get :get_step
      get :get_step_header
      get :get_run
      get :get_lineage
      get :get_file
      get :edit_name
      get :get_pipeline
      get :get_attributes
      get :get_attribute
      get :set_input_data
      get :set_geneset
      get :get_visualization
      get :get_dim_reduction_form
      post :dr_plot
      get :get_dr_options
      get :autocomplete_genes
      get :extract_row
      get :get_rows
      get :extract_metadata
      post :filter_de_results
      post :filter_ge_results
      get :clone
      post :delete_all_runs_from_step
      get :confirm_delete_all
      post :replot
 #     get :summary
      get :get_clusters
      post :cluster_comparison
      get :get_selections
      get :set_viz_session
      post :delete_batch_file
      post :direct_download
      get :save_plot_settings
    end
  end


  resources :project_steps
  resources :jobs

  match '/roadmap' => 'todos#index', :via => [:get]
  match 'hca_projects' => 'projects#hca_projects', :via => [:get]

  root 'projects#index'


end
